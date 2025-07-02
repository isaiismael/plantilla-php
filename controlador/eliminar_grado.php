<?php
session_start();
include_once '../modelo/conexion.php';

// Verificar si hay una sesión activa
if (empty($_SESSION['id'])) {
    header('location:../vista/login/login.php');
    exit;
}

// Verificar si se ha proporcionado un ID
if (!isset($_GET['id'])) {
    $_SESSION['error'] = "No se ha especificado el grado/sección a eliminar.";
    header('location:../vista/inicio.php');
    exit;
}

$id_grado_seccion = intval($_GET['id']);

if ($id_grado_seccion <= 0) {
    $_SESSION['error'] = "ID de grado/sección inválido.";
    header('location:../vista/inicio.php');
    exit;
}

try {
    // Verificar si hay archivos asociados al grado
    $query_archivos = "SELECT COUNT(*) as total FROM archivo_compartido WHERE id_grado_seccion = ?";
    $stmt = $conexion->prepare($query_archivos);
    $stmt->bind_param('i', $id_grado_seccion);
    $stmt->execute();
    $resultado = $stmt->get_result();
    $archivos = $resultado->fetch_object();
    
    if ($archivos->total > 0) {
        $_SESSION['error'] = "No se puede eliminar este grado/sección porque tiene archivos asociados. Elimine los archivos primero.";
        header('location:../vista/inicio.php');
        exit;
    }
    
    // Eliminar el grado/sección
    $query_eliminar = "DELETE FROM grado_seccion WHERE id_grado_seccion = ?";
    $stmt_eliminar = $conexion->prepare($query_eliminar);
    $stmt_eliminar->bind_param('i', $id_grado_seccion);
    
    if ($stmt_eliminar->execute()) {
        $_SESSION['success'] = "Grado y sección eliminados correctamente.";
    } else {
        $_SESSION['error'] = "Error al eliminar el grado y sección: " . $conexion->error;
    }
} catch (Exception $e) {
    $_SESSION['error'] = "Error: " . $e->getMessage();
}

// Redirigir a la página de inicio
header('location:../vista/inicio.php');
exit;
?>
