<?php
session_start();
include_once '../modelo/conexion.php';

// Verificar si hay una sesión activa
if (empty($_SESSION['id'])) {
    header('location:../vista/login/login.php');
    exit;
}

// Verificar si se ha proporcionado un ID
if (!isset($_GET['id']) || !isset($_GET['id_grado_seccion'])) {
    $_SESSION['error'] = "Parámetros incorrectos.";
    header('location:../vista/subir_archivos.php');
    exit;
}

$id_archivo = intval($_GET['id']);
$id_grado_seccion = intval($_GET['id_grado_seccion']);

if ($id_archivo <= 0) {
    $_SESSION['error'] = "ID de archivo inválido.";
    header("location:../vista/listar_archivos.php?id_grado_seccion=$id_grado_seccion");
    exit;
}

try {
    // Primero obtenemos el nombre del archivo para eliminarlo del sistema de archivos
    $query_archivo = "SELECT archivo FROM archivo_compartido WHERE id_archivo_compartido = ?";
    $stmt = $conexion->prepare($query_archivo);
    $stmt->bind_param('i', $id_archivo);
    $stmt->execute();
    $resultado = $stmt->get_result();
    
    if ($resultado->num_rows > 0) {
        $archivo = $resultado->fetch_object();
        $ruta_archivo = "../public/archivos/compartido/" . $archivo->archivo;
        
        // Eliminar el archivo físico si existe
        if (file_exists($ruta_archivo)) {
            unlink($ruta_archivo);
        }
        
        // Eliminar el registro de la base de datos
        $query_eliminar = "DELETE FROM archivo_compartido WHERE id_archivo_compartido = ?";
        $stmt_eliminar = $conexion->prepare($query_eliminar);
        $stmt_eliminar->bind_param('i', $id_archivo);
        
        if ($stmt_eliminar->execute()) {
            $_SESSION['success'] = "Archivo eliminado correctamente.";
        } else {
            $_SESSION['error'] = "Error al eliminar el archivo de la base de datos.";
        }
    } else {
        $_SESSION['error'] = "El archivo no existe.";
    }
} catch (Exception $e) {
    $_SESSION['error'] = "Error: " . $e->getMessage();
}

// Redirigir a la lista de archivos
header("location:../vista/listar_archivos.php?id_grado_seccion=$id_grado_seccion");
exit;
?>
