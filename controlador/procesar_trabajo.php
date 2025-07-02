<?php
// Asegurarse de iniciar la sesión para poder usar variables de sesión
session_start();
include_once '../modelo/conexion.php';

// Verificar si se ha enviado el formulario
if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    // Obtener datos del formulario
    $id_grado_seccion = isset($_POST['id_grado_seccion']) ? intval($_POST['id_grado_seccion']) : 0;
    $nombre = isset($_POST['nombre']) ? trim($_POST['nombre']) : '';
    $fecha = date('Y-m-d H:i:s');

    // Validar datos
    if ($id_grado_seccion <= 0 || empty($nombre)) {
        $_SESSION['error'] = "Faltan datos obligatorios.";
        header("Location: ../mis_archivos.php?id_grado_seccion=$id_grado_seccion");
        exit;
    }

    // Procesar el archivo
    if (isset($_FILES['archivo']) && $_FILES['archivo']['error'] == 0) {
        $archivo = $_FILES['archivo'];
        $nombre_archivo = $archivo['name'];
        $tipo_archivo = $archivo['type'];
        $tamano_archivo = $archivo['size'];
        $temp_archivo = $archivo['tmp_name'];

        // Generar nombre único para el archivo
        $nombre_unico = uniqid() . '_' . $nombre_archivo;

        // Crear directorio si no existe
        $directorio = "../public/archivos/trabajos/";
        if (!is_dir($directorio)) {
            mkdir($directorio, 0777, true);
        }

        // Guardar el archivo
        $ruta_destino = $directorio . $nombre_unico;

        if (move_uploaded_file($temp_archivo, $ruta_destino)) {
            // Guardar información en la base de datos
            $query = "INSERT INTO trabajo (id_grado_seccion, nombre, archivo, fecha) 
                      VALUES (?, ?, ?, ?)";

            $stmt = $conexion->prepare($query);
            $stmt->bind_param('isss', $id_grado_seccion, $nombre, $nombre_unico, $fecha);

            if ($stmt->execute()) {
                $_SESSION['success'] = "Trabajo entregado correctamente.";
                header("Location: ../mis_archivos.php?id_grado_seccion=$id_grado_seccion");
                exit;
            } else {
                $_SESSION['error'] = "Error al guardar la información en la base de datos: " . $stmt->error;
                header("Location: ../mis_archivos.php?id_grado_seccion=$id_grado_seccion");
                exit;
            }
        } else {
            $_SESSION['error'] = "Error al subir el archivo.";
            header("Location: ../mis_archivos.php?id_grado_seccion=$id_grado_seccion");
            exit;
        }
    } else {
        $_SESSION['error'] = "No se ha seleccionado ningún archivo o ha ocurrido un error.";
        header("Location: ../mis_archivos.php?id_grado_seccion=$id_grado_seccion");
        exit;
    }
} else {
    // Si no es un POST, redirigir a la página principal
    header("Location: ../index.php");
    exit;
}
