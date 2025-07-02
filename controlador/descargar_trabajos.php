<?php
session_start();
include_once '../modelo/conexion.php';

// Verificar si hay una sesión activa
if (empty($_SESSION['id'])) {
    header('location:../vista/login/login.php');
    exit;
}

// Verificar si se ha proporcionado un ID de grado_seccion
$id_grado_seccion = isset($_GET['id_grado_seccion']) ? intval($_GET['id_grado_seccion']) : 0;

if ($id_grado_seccion <= 0) {
    $_SESSION['error'] = "No se ha seleccionado un grado y sección válido.";
    header('location:../vista/ver_trabajos.php');
    exit;
}

// Verificar si se han seleccionado fechas específicas
$fechas_seleccionadas = isset($_GET['selected_dates']) ? $_GET['selected_dates'] : [];

// Validar que al menos una fecha esté seleccionada
if (empty($fechas_seleccionadas)) {
    $_SESSION['error'] = "Debe seleccionar al menos una fecha para descargar trabajos.";
    header("location:../vista/trabajos_grado.php?id_grado_seccion=$id_grado_seccion");
    exit;
}

// Obtener información del grado
$grado_query = $conexion->query("SELECT * FROM grado_seccion WHERE id_grado_seccion = $id_grado_seccion");
$grado_info = $grado_query->fetch_object();

if (!$grado_info) {
    $_SESSION['error'] = "El grado y sección seleccionado no existe.";
    header('location:../vista/ver_trabajos.php');
    exit;
}

// Construir la consulta SQL con filtro de fechas
$sql = "SELECT * FROM trabajo WHERE id_grado_seccion = $id_grado_seccion";

$fechas_placeholders = implode("','", array_map(function($fecha) use ($conexion) {
    return $conexion->real_escape_string($fecha);
}, $fechas_seleccionadas));

$sql .= " AND DATE(fecha) IN ('$fechas_placeholders')";
$sql .= " ORDER BY fecha DESC";

// Obtener los trabajos del grado con el filtro aplicado
$trabajos_query = $conexion->query($sql);

if ($trabajos_query->num_rows == 0) {
    $_SESSION['error'] = "No hay trabajos disponibles para descargar con los filtros seleccionados.";
    header("location:../vista/trabajos_grado.php?id_grado_seccion=$id_grado_seccion");
    exit;
}

// Crear un archivo ZIP temporal
$temp_file = tempnam(sys_get_temp_dir(), 'zip');
$zip = new ZipArchive();

if ($zip->open($temp_file, ZipArchive::CREATE | ZipArchive::OVERWRITE) !== TRUE) {
    $_SESSION['error'] = "No se pudo crear el archivo ZIP.";
    header("location:../vista/trabajos_grado.php?id_grado_seccion=$id_grado_seccion");
    exit;
}

// Directorio de trabajos
$trabajos_dir = '../public/archivos/trabajos/';

// Verificar si se seleccionó una sola fecha o múltiples
$multiple_fechas = count($fechas_seleccionadas) > 1;

// Añadir cada trabajo al ZIP
$archivos_agregados = 0;

while ($trabajo = $trabajos_query->fetch_object()) {
    $archivo_path = $trabajos_dir . $trabajo->archivo;
    
    if (file_exists($archivo_path)) {
        $fecha_str = date('Y-m-d', strtotime($trabajo->fecha));
        
        if ($multiple_fechas) {
            // Si hay múltiples fechas, organizar por carpetas
            $ruta_en_zip = "$fecha_str/{$trabajo->nombre}_{$trabajo->archivo}";
        } else {
            // Si es una sola fecha, poner todos los archivos en la raíz
            $ruta_en_zip = "{$trabajo->nombre}_{$trabajo->archivo}";
        }
        
        $zip->addFile($archivo_path, $ruta_en_zip);
        $archivos_agregados++;
    }
}

// Cerrar el ZIP
$zip->close();

if ($archivos_agregados == 0) {
    $_SESSION['error'] = "No se encontraron archivos físicos para agregar al ZIP.";
    header("location:../vista/trabajos_grado.php?id_grado_seccion=$id_grado_seccion");
    exit;
}

// Nombre del archivo ZIP a descargar
$fecha_actual = date('Y-m-d');
$fechas_info = $multiple_fechas ? "varias_fechas" : $fechas_seleccionadas[0];
$zip_name = "Trabajos_{$grado_info->grado}_{$grado_info->seccion}_{$fechas_info}_{$fecha_actual}.zip";

// Enviar el archivo al navegador
header('Content-Type: application/zip');
header('Content-Disposition: attachment; filename="' . $zip_name . '"');
header('Content-Length: ' . filesize($temp_file));
header('Pragma: no-cache');
header('Expires: 0');

// Leer y enviar el archivo
readfile($temp_file);

// Eliminar el archivo temporal
unlink($temp_file);
exit;
?>
