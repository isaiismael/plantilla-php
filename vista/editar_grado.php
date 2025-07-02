<?php
session_start();
if (empty($_SESSION['id'])) {
    header('location:login/login.php');
    exit;
}

// Verificar si se ha proporcionado un ID
if (!isset($_GET['id'])) {
    $_SESSION['error'] = "No se ha especificado el grado/sección a editar.";
    header('location:inicio.php');
    exit;
}

$id_grado_seccion = intval($_GET['id']);

// Obtener información del grado/sección
include_once '../modelo/conexion.php';
$query = "SELECT * FROM grado_seccion WHERE id_grado_seccion = ?";
$stmt = $conexion->prepare($query);
$stmt->bind_param('i', $id_grado_seccion);
$stmt->execute();
$resultado = $stmt->get_result();

if ($resultado->num_rows == 0) {
    $_SESSION['error'] = "El grado/sección no existe.";
    header('location:inicio.php');
    exit;
}

$grado = $resultado->fetch_object();
?>

<!-- primero se carga el topbar -->
<?php require('./layout/topbar.php'); ?>
<!-- luego se carga el sidebar -->
<?php require('./layout/sidebar.php'); ?>

<!-- inicio del contenido principal -->
<div class="page-content">
    <style>
        .form-container {
            max-width: 600px;
            margin: 40px auto;
            padding: 30px;
            background-color: #fff;
            border-radius: 10px;
            box-shadow: 0 5px 15px rgba(0, 0, 0, 0.1);
        }

        .form-title {
            color: #2c3e50;
            margin-bottom: 25px;
            padding-bottom: 15px;
            border-bottom: 2px solid #eee;
            text-align: center;
        }

        .form-group {
            margin-bottom: 20px;
        }

        .form-group label {
            display: block;
            margin-bottom: 8px;
            font-weight: bold;
            color: #555;
        }

        .form-control {
            width: 100%;
            padding: 12px 15px;
            border: 1px solid #ddd;
            border-radius: 5px;
            font-size: 16px;
        }

        .form-control:focus {
            border-color: #3498db;
            box-shadow: 0 0 5px rgba(52, 152, 219, 0.3);
        }

        .btn-submit {
            background-color: #3498db;
            color: white;
            border: none;
            padding: 12px 25px;
            border-radius: 5px;
            cursor: pointer;
            font-size: 16px;
            transition: all 0.3s ease;
            display: block;
            width: 100%;
        }

        .btn-submit:hover {
            background-color: #2980b9;
            transform: translateY(-2px);
        }

        .back-link {
            color: #3498db;
            text-decoration: none;
            display: inline-block;
            margin-bottom: 20px;
        }

        .back-link:hover {
            text-decoration: underline;
        }

        .estado-switch {
            display: flex;
            align-items: center;
            gap: 10px;
        }

        .switch-label {
            font-weight: bold;
            color: #555;
        }

        ul li:nth-child(1) .activo {
            background: rgb(11, 150, 214) !important;
        }
    </style>

    <!-- Código para mostrar notificaciones con PNotify -->
    <script>
        document.addEventListener('DOMContentLoaded', function() {
            <?php if (isset($_SESSION['success'])): ?>
                new PNotify({
                    title: 'Éxito',
                    text: '<?php echo $_SESSION["success"]; ?>',
                    type: 'success',
                    styling: 'bootstrap3'
                });
                <?php unset($_SESSION['success']); ?>
            <?php endif; ?>

            <?php if (isset($_SESSION['error'])): ?>
                new PNotify({
                    title: 'Error',
                    text: '<?php echo $_SESSION["error"]; ?>',
                    type: 'error',
                    styling: 'bootstrap3'
                });
                <?php unset($_SESSION['error']); ?>
            <?php endif; ?>
        });
    </script>

    <a href="inicio.php" class="back-link">← Volver a la lista de grados</a>

    <div class="form-container">
        <h2 class="form-title">Editar Grado y Sección</h2>

        <form action="../controlador/actualizar_grado.php" method="POST">
            <input type="hidden" name="id_grado_seccion" value="<?php echo $grado->id_grado_seccion; ?>">

            <div class="form-group">
                <label for="grado">Grado:</label>
                <input type="text" class="form-control" id="grado" name="grado" value="<?php echo $grado->grado; ?>" required>
            </div>

            <div class="form-group">
                <label for="seccion">Sección:</label>
                <input type="text" class="form-control" id="seccion" name="seccion" value="<?php echo $grado->seccion; ?>" required>
            </div>

            <div class="form-group">
                <div class="estado-switch">
                    <span class="switch-label">Estado:</span>
                    <label class="switch">
                        <input type="checkbox" name="estado" value="1" <?php echo ($grado->estado == '1') ? 'checked' : ''; ?>>
                        <span class="slider"></span>
                    </label>
                    <span class="status-text"><?php echo ($grado->estado == '1') ? 'Habilitado' : 'Deshabilitado'; ?></span>
                </div>
            </div>

            <div class="form-group">
                <button type="submit" class="btn-submit">Actualizar Grado y Sección</button>
            </div>
        </form>
    </div>
</div>
<!-- fin del contenido principal -->

<!-- por ultimo se carga el footer -->
<?php require('./layout/footer.php'); ?>