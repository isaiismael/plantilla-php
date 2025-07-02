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
    $id_archivo = isset($_POST['id_archivo']) ? intval($_POST['id_archivo']) : 0;
    $id_grado_seccion = isset($_POST['id_grado_seccion']) ? intval($_POST['id_grado_seccion']) : 0;
    $titulo = isset($_POST['titulo']) ? trim($_POST['titulo']) : '';
    $descripcion = isset($_POST['descripcion']) ? trim($_POST['descripcion']) : '';

    // Validar datos
    if ($id_archivo <= 0 || $id_grado_seccion <= 0 || empty($titulo)) {
        $_SESSION['error'] = "Faltan datos obligatorios.";
        header("Location: ../vista/editar_archivo.php?id=$id_archivo");
        exit;
    }

    // Comprobar si se ha subido un nuevo archivo
    $hay_nuevo_archivo = isset($_FILES['archivo']) && $_FILES['archivo']['error'] == 0;
    
    // Si hay un nuevo archivo, procesar la subida
    if ($hay_nuevo_archivo) {
        $archivo = $_FILES['archivo'];
        $nombre_archivo = $archivo['name'];
        $tamano_archivo = $archivo['size'];
        $temp_archivo = $archivo['tmp_name'];

        // La validación de tamaño máximo ha sido eliminada
        // para permitir archivos de cualquier tamaño

        // Obtener el nombre del archivo anterior para eliminarlo
        $query_archivo = "SELECT archivo FROM archivo_compartido WHERE id_archivo_compartido = ?";
        $stmt = $conexion->prepare($query_archivo);
        $stmt->bind_param('i', $id_archivo);
        $stmt->execute();
        $resultado = $stmt->get_result();
        $archivo_anterior = $resultado->fetch_object();
        
        // Generar nombre único para el nuevo archivo
        $nombre_unico = uniqid() . '_' . $nombre_archivo;

        // Crear directorio si no existe
        $directorio = "../public/archivos/compartido/";
        if (!is_dir($directorio)) {
            mkdir($directorio, 0777, true);
        }

        // Guardar el nuevo archivo
        $ruta_destino = $directorio . $nombre_unico;

        if (!move_uploaded_file($temp_archivo, $ruta_destino)) {
            $_SESSION['error'] = "Error al subir el nuevo archivo.";
            header("Location: ../vista/editar_archivo.php?id=$id_archivo");
            exit;
        }

        // Eliminar el archivo anterior si existe
        if ($archivo_anterior && file_exists($directorio . $archivo_anterior->archivo)) {
            unlink($directorio . $archivo_anterior->archivo);
        }

        // Actualizar la base de datos con el nuevo archivo
        $query = "UPDATE archivo_compartido SET titulo = ?, descripcion = ?, archivo = ? WHERE id_archivo_compartido = ?";
        $stmt = $conexion->prepare($query);
        $stmt->bind_param('sssi', $titulo, $descripcion, $nombre_unico, $id_archivo);
    } else {
        // Solo actualizar los datos de texto
        $query = "UPDATE archivo_compartido SET titulo = ?, descripcion = ? WHERE id_archivo_compartido = ?";
        $stmt = $conexion->prepare($query);
        $stmt->bind_param('ssi', $titulo, $descripcion, $id_archivo);
    }

    // Ejecutar la actualización
    if ($stmt->execute()) {
        $_SESSION['success'] = "Archivo actualizado correctamente.";
        header("Location: ../vista/listar_archivos.php?id_grado_seccion=$id_grado_seccion");
        exit;
    } else {
        $_SESSION['error'] = "Error al actualizar la información en la base de datos: " . $stmt->error;
        header("Location: ../vista/editar_archivo.php?id=$id_archivo");
        exit;
    }
} else {
    // Si no es un POST, redirigir a la página de grados
    header("Location: ../vista/subir_archivos.php");
    exit;
}
?>
