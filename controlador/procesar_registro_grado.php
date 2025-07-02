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
    $grado = isset($_POST['grado']) ? trim($_POST['grado']) : '';
    $seccion = isset($_POST['seccion']) ? trim($_POST['seccion']) : '';
    $estado = isset($_POST['estado']) ? '1' : '0';

    // Validar datos básicos
    if (empty($grado) || empty($seccion)) {
        $_SESSION['error'] = "Los campos de grado y sección no pueden estar vacíos.";
        header("Location: ../vista/registrar_grado.php");
        exit;
    }

    // Verificar si ya existe otro grado/sección con la misma combinación
    $query_check = "SELECT COUNT(*) as total FROM grado_seccion WHERE grado = ? AND seccion = ?";
    $stmt_check = $conexion->prepare($query_check);
    $stmt_check->bind_param('ss', $grado, $seccion);
    $stmt_check->execute();
    $result_check = $stmt_check->get_result();
    $row_check = $result_check->fetch_object();

    if ($row_check->total > 0) {
        $_SESSION['error'] = "Ya existe un grado {$grado} con la sección {$seccion}.";
        header("Location: ../vista/registrar_grado.php");
        exit;
    }

    // Insertar el nuevo grado/sección
    $query = "INSERT INTO grado_seccion (grado, seccion, estado) VALUES (?, ?, ?)";
    $stmt = $conexion->prepare($query);
    $stmt->bind_param('sss', $grado, $seccion, $estado);

    if ($stmt->execute()) {
        $_SESSION['success'] = "Grado y sección registrados correctamente.";
        header("Location: ../vista/inicio.php");
        exit;
    } else {
        $_SESSION['error'] = "Error al registrar el grado y sección: " . $conexion->error;
        header("Location: ../vista/registrar_grado.php");
        exit;
    }
} else {
    // Si no es un POST, redirigir a la página de registro
    header("Location: ../vista/registrar_grado.php");
    exit;
}
?>
    exit;
}
?>
