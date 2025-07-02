<?php
session_start();
if (empty($_SESSION['id'])) {
    header('location:login/login.php');
}

// Verificar si se ha seleccionado un grado_seccion
$id_grado_seccion = isset($_GET['id_grado_seccion']) ? intval($_GET['id_grado_seccion']) : 0;

if ($id_grado_seccion <= 0) {
    header('location:subir_archivos.php');
    exit;
}

// Obtener información del grado seleccionado
include_once '../modelo/conexion.php';
$grado_query = $conexion->query("SELECT * FROM grado_seccion WHERE id_grado_seccion = $id_grado_seccion");
$grado_info = $grado_query->fetch_object();

// Obtener los archivos de este grado
$archivos_query = $conexion->query("SELECT * FROM archivo_compartido WHERE id_grado_seccion = $id_grado_seccion ORDER BY fecha DESC");
?>

<!-- primero se carga el topbar -->
<?php require('./layout/topbar.php'); ?>
<!-- luego se carga el sidebar -->
<?php require('./layout/sidebar.php'); ?>

<!-- inicio del contenido principal -->
<div class="page-content">
    <style>
        .page-header {
            display: flex;
            justify-content: space-between;
            align-items: center;
            margin-bottom: 30px;
        }

        .page-title {
            color: #2c3e50;
            font-size: 1.8rem;
        }

        .btn-primary {
            background-color: #3498db;
            color: white;
            padding: 10px 20px;
            border-radius: 5px;
            text-decoration: none;
            font-weight: bold;
            transition: all 0.3s;
        }

        .btn-primary:hover {
            background-color: #2980b9;
            transform: translateY(-2px);
        }

        .file-table {
            width: 100%;
            border-collapse: collapse;
            margin-top: 20px;
            box-shadow: 0 2px 10px rgba(0, 0, 0, 0.1);
        }

        .file-table th,
        .file-table td {
            border: 1px solid #ddd;
            padding: 12px 15px;
            text-align: left;
        }

        .file-table th {
            background-color: #f2f2f2;
            color: #333;
            font-weight: bold;
        }

        .file-table tr:nth-child(even) {
            background-color: #f9f9f9;
        }

        .file-table tr:hover {
            background-color: #f1f1f1;
        }

        .action-buttons {
            display: flex;
            gap: 10px;
        }

        .btn-edit,
        .btn-download,
        .btn-delete {
            padding: 6px 10px;
            border-radius: 4px;
            text-decoration: none;
            font-size: 12px;
            font-weight: bold;
            text-align: center;
            transition: all 0.2s;
        }

        .btn-edit {
            background-color: #3498db;
            color: white;
        }

        .btn-edit:hover {
            background-color: #2980b9;
        }

        .btn-download {
            background-color: #27ae60;
            color: white;
        }

        .btn-download:hover {
            background-color: #219955;
        }

        .btn-delete {
            background-color: #e74c3c;
            color: white;
        }

        .btn-delete:hover {
            background-color: #c0392b;
        }

        .empty-message {
            padding: 20px;
            background-color: #f8f9fa;
            border-radius: 5px;
            color: #666;
            text-align: center;
            margin-top: 20px;
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

        ul li:nth-child(2) .activo {
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

        // Función para confirmar eliminación
        function confirmarEliminar(id) {
            if (confirm("¿Está seguro que desea eliminar este archivo? Esta acción no se puede deshacer.")) {
                window.location.href = "../controlador/eliminar_archivo.php?id=" + id + "&id_grado_seccion=<?php echo $id_grado_seccion; ?>";
            }
        }
    </script>

    <a href="subir_archivos.php" class="back-link">← Volver a la lista de grados</a>

    <div class="page-header">
        <h2 class="page-title">Archivos compartidos - <?php echo "{$grado_info->grado}° {$grado_info->seccion}"; ?></h2>
        <a href="subir_archivos.php?id_grado_seccion=<?php echo $id_grado_seccion; ?>" class="btn-primary">+ Subir nuevo archivo</a>
    </div>

    <?php if ($archivos_query->num_rows > 0): ?>
        <table class="file-table">
            <thead>
                <tr>
                    <th>Título</th>
                    <th>Descripción</th>
                    <th>Archivo</th>
                    <th>Fecha</th>
                    <th>Acciones</th>
                </tr>
            </thead>
            <tbody>
                <?php while ($archivo = $archivos_query->fetch_object()): ?>
                    <tr>
                        <td><?php echo $archivo->titulo; ?></td>
                        <td><?php echo $archivo->descripcion ? $archivo->descripcion : "<em>Sin descripción</em>"; ?></td>
                        <td><?php echo $archivo->archivo; ?></td>
                        <td><?php echo date('d/m/Y H:i', strtotime($archivo->fecha)); ?></td>
                        <td class="action-buttons">
                            <a href="editar_archivo.php?id=<?php echo $archivo->id_archivo_compartido; ?>" class="btn-edit">Editar</a>
                            <a href="../public/archivos/compartido/<?php echo $archivo->archivo; ?>" class="btn-download" download>Descargar</a>
                            <a href="javascript:void(0)" onclick="confirmarEliminar(<?php echo $archivo->id_archivo_compartido; ?>)" class="btn-delete">Eliminar</a>
                        </td>
                    </tr>
                <?php endwhile; ?>
            </tbody>
        </table>
    <?php else: ?>
        <div class="empty-message">
            No hay archivos compartidos para este grado y sección. ¡Comience subiendo uno nuevo!
        </div>
    <?php endif; ?>

</div>
<!-- fin del contenido principal -->

<!-- por ultimo se carga el footer -->
<?php require('./layout/footer.php'); ?>