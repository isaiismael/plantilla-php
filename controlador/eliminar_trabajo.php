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
    header('location:../vista/ver_trabajos.php');
    exit;
}

$id_trabajo = intval($_GET['id']);
$id_grado_seccion = intval($_GET['id_grado_seccion']);

if ($id_trabajo <= 0) {
    $_SESSION['error'] = "ID de trabajo inválido.";
    header("location:../vista/trabajos_grado.php?id_grado_seccion=$id_grado_seccion");
    exit;
}

try {
    // Primero obtenemos el nombre del archivo para eliminarlo del sistema de archivos
    $query_trabajo = "SELECT archivo FROM trabajo WHERE id_trabajo = ?";
    $stmt = $conexion->prepare($query_trabajo);
    $stmt->bind_param('i', $id_trabajo);
    $stmt->execute();
    $resultado = $stmt->get_result();
    
    if ($resultado->num_rows > 0) {
        $trabajo = $resultado->fetch_object();
        $ruta_archivo = "../public/archivos/trabajos/" . $trabajo->archivo;
        
        // Eliminar el archivo físico si existe
        if (file_exists($ruta_archivo)) {
            unlink($ruta_archivo);
        }
        
        // Eliminar el registro de la base de datos
        $query_eliminar = "DELETE FROM trabajo WHERE id_trabajo = ?";
        $stmt_eliminar = $conexion->prepare($query_eliminar);
        $stmt_eliminar->bind_param('i', $id_trabajo);
        
        if ($stmt_eliminar->execute()) {
            $_SESSION['success'] = "Trabajo eliminado correctamente.";
        } else {
            $_SESSION['error'] = "Error al eliminar el trabajo de la base de datos: " . $conexion->error;
        }
    } else {
        $_SESSION['error'] = "El trabajo no existe.";
    }
} catch (Exception $e) {
    $_SESSION['error'] = "Error: " . $e->getMessage();
}

// Redirigir a la lista de trabajos
header("location:../vista/trabajos_grado.php?id_grado_seccion=$id_grado_seccion");
exit;
?>
