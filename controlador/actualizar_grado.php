<?php
session_start();
include_once '../modelo/conexion.php';

// Verificar si hay una sesión activa
if (empty($_SESSION['id'])) {
    header('location:../vista/login/login.php');
    exit;
}

// Verificar si se ha enviado el formulario
if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    // Obtener datos del formulario
    $id_grado_seccion = isset($_POST['id_grado_seccion']) ? intval($_POST['id_grado_seccion']) : 0;
    $grado = isset($_POST['grado']) ? trim($_POST['grado']) : '';
    $seccion = isset($_POST['seccion']) ? trim($_POST['seccion']) : '';
    $estado = isset($_POST['estado']) ? '1' : '0';

    // Validar datos básicos
    if ($id_grado_seccion <= 0 || empty($grado) || empty($seccion)) {
        $_SESSION['error'] = "Los campos de grado y sección no pueden estar vacíos.";
        header("Location: ../vista/editar_grado.php?id=$id_grado_seccion");
        exit;
    }

    // Verificar si ya existe otro grado/sección con la misma combinación (excepto el actual)
    $query_check = "SELECT COUNT(*) as total FROM grado_seccion WHERE grado = ? AND seccion = ? AND id_grado_seccion != ?";
    $stmt_check = $conexion->prepare($query_check);
    $stmt_check->bind_param('ssi', $grado, $seccion, $id_grado_seccion);
    $stmt_check->execute();
    $result_check = $stmt_check->get_result();
    $row_check = $result_check->fetch_object();

    if ($row_check->total > 0) {
        $_SESSION['error'] = "Ya existe un grado {$grado} con la sección {$seccion}.";
        header("Location: ../vista/editar_grado.php?id=$id_grado_seccion");
        exit;
    }

    // Actualizar el grado/sección
    $query = "UPDATE grado_seccion SET grado = ?, seccion = ?, estado = ? WHERE id_grado_seccion = ?";
    $stmt = $conexion->prepare($query);
    $stmt->bind_param('sssi', $grado, $seccion, $estado, $id_grado_seccion);

    if ($stmt->execute()) {
        $_SESSION['success'] = "Grado y sección actualizados correctamente.";
        header("Location: ../vista/inicio.php");
        exit;
    } else {
        $_SESSION['error'] = "Error al actualizar el grado y sección: " . $conexion->error;
        header("Location: ../vista/editar_grado.php?id=$id_grado_seccion");
        exit;
    }
} else {
    // Si no es un POST, redirigir a la página de inicio
    header("Location: ../vista/inicio.php");
    exit;
}
?>
