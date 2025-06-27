<?php
// Include database connection
include_once '../modelo/conexion.php';

// Set content type to JSON
header('Content-Type: application/json');

// Check if the request is POST
if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    // Get parameters from the request
    $id_grado_seccion = isset($_POST['id_grado_seccion']) ? intval($_POST['id_grado_seccion']) : 0;
    $estado = isset($_POST['estado']) ? intval($_POST['estado']) : 0;
    
    // Debug info
    error_log("Updating grade status: ID=$id_grado_seccion, Estado=$estado");
    
    // Validate parameters
    if ($id_grado_seccion <= 0) {
        echo json_encode(['success' => false, 'message' => 'ID de grado/sección inválido']);
        exit;
    }
    
    try {
        // Update the database
        $query = "UPDATE grado_seccion SET estado = ? WHERE id_grado_seccion = ?";
        $stmt = $conexion->prepare($query);
        $stmt->bind_param('ii', $estado, $id_grado_seccion);
        
        $result = $stmt->execute();
        
        if ($result) {
            echo json_encode(['success' => true, 'message' => 'Estado actualizado correctamente']);
        } else {
            echo json_encode(['success' => false, 'message' => 'Error al actualizar: ' . $conexion->error]);
        }
        
        $stmt->close();
    } catch (Exception $e) {
        echo json_encode(['success' => false, 'message' => 'Error: ' . $e->getMessage()]);
    }
} else {
    // If not a POST request
    echo json_encode(['success' => false, 'message' => 'Método no permitido']);
}
?>
