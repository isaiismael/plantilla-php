<?php
session_start();
if (empty($_SESSION['id'])) {
    header('location:login/login.php');
}

// Verificar si se ha seleccionado un grado_seccion
$id_grado_seccion = isset($_GET['id_grado_seccion']) ? intval($_GET['id_grado_seccion']) : 0;

if ($id_grado_seccion <= 0) {
    $_SESSION['error'] = "No se ha seleccionado un grado y sección válido.";
    header('location:ver_trabajos.php');
    exit;
}

// Obtener información del grado seleccionado
include_once '../modelo/conexion.php';
$grado_query = $conexion->query("SELECT * FROM grado_seccion WHERE id_grado_seccion = $id_grado_seccion");
$grado_info = $grado_query->fetch_object();

if (!$grado_info) {
    $_SESSION['error'] = "El grado y sección seleccionado no existe.";
    header('location:ver_trabajos.php');
    exit;
}

// Obtener los trabajos subidos para este grado
$trabajos_query = $conexion->query("SELECT * FROM trabajo WHERE id_grado_seccion = $id_grado_seccion ORDER BY fecha DESC");

// Obtener fechas únicas para el filtro
$fechas_query = $conexion->query("SELECT DISTINCT DATE(fecha) as fecha_unica FROM trabajo 
                                 WHERE id_grado_seccion = $id_grado_seccion 
                                 ORDER BY fecha_unica DESC");
$fechas_disponibles = [];
while ($fecha = $fechas_query->fetch_object()) {
    $fechas_disponibles[] = $fecha->fecha_unica;
}
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

        .btn-success {
            background-color: #27ae60;
            color: white;
            padding: 10px 20px;
            border-radius: 5px;
            text-decoration: none;
            font-weight: bold;
            transition: all 0.3s;
        }

        .btn-success:hover {
            background-color: #219955;
            transform: translateY(-2px);
        }

        .table {
            width: 100%;
            border-collapse: collapse;
            margin-top: 20px;
            box-shadow: 0 2px 10px rgba(0, 0, 0, 0.1);
        }

        .table th,
        .table td {
            border: 1px solid #ddd;
            padding: 12px 15px;
            text-align: left;
        }

        .table th {
            background-color: #3498db;
            color: white;
        }

        .table tr:nth-child(even) {
            background-color: #f9f9f9;
        }

        .table tr:hover {
            background-color: #f1f1f1;
        }

        .action-buttons {
            display: flex;
            gap: 10px;
        }

        .btn-action {
            padding: 6px 10px;
            border-radius: 4px;
            text-decoration: none;
            font-size: 12px;
            font-weight: bold;
            text-align: center;
            transition: all 0.2s;
        }

        .btn-download {
            background-color: #27ae60;
            color: white;
        }

        .btn-download:hover {
            background-color: #219955;
        }

        .empty-message {
            background-color: #f8f9fa;
            padding: 20px;
            border-radius: 5px;
            text-align: center;
            color: #6c757d;
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

        thead tr th {
            background: #3498db!important;
        }

        ul li:nth-child(3) .activo {
            background: rgb(11, 150, 214) !important;
        }

        .filter-container {
            background-color: #f8f9fa;
            padding: 20px;
            border-radius: 8px;
            margin-bottom: 25px;
            box-shadow: 0 2px 5px rgba(0,0,0,0.1);
        }
        
        .filter-title {
            font-size: 18px;
            color: #2c3e50;
            margin-bottom: 15px;
            font-weight: bold;
        }
        
        .date-filters {
            display: flex;
            gap: 15px;
            margin-bottom: 15px;
            flex-wrap: wrap;
        }
        
        .date-group {
            flex: 1;
            min-width: 200px;
        }
        
        .checkbox-group {
            display: flex;
            flex-wrap: wrap;
            gap: 10px;
            margin-top: 15px;
        }
        
        .date-checkbox {
            background-color: #e8f4f8;
            padding: 8px 12px;
            border-radius: 4px;
            display: flex;
            align-items: center;
            gap: 8px;
            cursor: pointer;
            transition: all 0.2s;
        }
        
        .date-checkbox:hover {
            background-color: #d1e8f0;
        }
        
        .select-all {
            margin-bottom: 10px;
        }
        
        .filter-buttons {
            display: flex;
            gap: 10px;
            margin-top: 15px;
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

        // Función para seleccionar/deseleccionar todos los checkboxes
        function toggleAllCheckboxes(source) {
            const checkboxes = document.getElementsByName('selected_dates[]');
            for(let i=0; i<checkboxes.length; i++) {
                checkboxes[i].checked = source.checked;
            }
        }

        // Función para validar el formulario antes de enviar
        function validarFormulario() {
            const checkboxes = document.getElementsByName('selected_dates[]');
            let alMenosUnoSeleccionado = false;
            
            for(let i=0; i<checkboxes.length; i++) {
                if(checkboxes[i].checked) {
                    alMenosUnoSeleccionado = true;
                    break;
                }
            }
            
            if(!alMenosUnoSeleccionado) {
                new PNotify({
                    title: 'Error',
                    text: 'Debe seleccionar al menos una fecha para descargar trabajos.',
                    type: 'error',
                    styling: 'bootstrap3'
                });
                return false;
            }
            
            return true;
        }
        
        // Función para confirmar eliminación de trabajo
        function confirmarEliminarTrabajo(id_trabajo) {
            if (confirm("¿Está seguro que desea eliminar este trabajo? Esta acción no se puede deshacer.")) {
                window.location.href = "../controlador/eliminar_trabajo.php?id=" + id_trabajo + "&id_grado_seccion=<?php echo $id_grado_seccion; ?>";
            }
        }
    </script>

    <a href="ver_trabajos.php" class="back-link">← Volver a la selección de grados</a>

    <div class="page-header">
        <h2 class="page-title">Trabajos de <?php echo "{$grado_info->grado}° {$grado_info->seccion}"; ?></h2>
    </div>

    <?php if ($trabajos_query->num_rows > 0): ?>
        <!-- Filtros de fecha -->
        <div class="filter-container">
            <div class="filter-title">Filtrar trabajos por fecha</div>
            
            <form action="../controlador/descargar_trabajos.php" method="GET" onsubmit="return validarFormulario()">
                <input type="hidden" name="id_grado_seccion" value="<?php echo $id_grado_seccion; ?>">
                
                <?php if (count($fechas_disponibles) > 0): ?>
                    <div class="select-all">
                        <label>
                            <input type="checkbox" onclick="toggleAllCheckboxes(this)" checked> Seleccionar todas las fechas
                        </label>
                    </div>
                    
                    <div class="checkbox-group">
                        <?php foreach ($fechas_disponibles as $fecha): ?>
                            <label class="date-checkbox">
                                <input type="checkbox" name="selected_dates[]" value="<?php echo $fecha; ?>" checked>
                                <?php echo date('d/m/Y', strtotime($fecha)); ?>
                            </label>
                        <?php endforeach; ?>
                    </div>
                    
                    <div class="filter-buttons">
                        <button type="submit" class="btn-success">
                            <i class="fas fa-download"></i> Descargar trabajos seleccionados
                        </button>
                    </div>
                <?php else: ?>
                    <p>No hay fechas disponibles para filtrar.</p>
                <?php endif; ?>
            </form>
        </div>

        <div class="table-responsive">
            <table class="table">
                <thead>
                    <tr>
                        <th>Nombre del trabajo</th>
                        <th>Archivo</th>
                        <th>Fecha de entrega</th>
                        <th>Acciones</th>
                    </tr>
                </thead>
                <tbody>
                    <?php 
                    // Reiniciar el puntero del resultado de la consulta
                    $trabajos_query->data_seek(0);
                    while ($trabajo = $trabajos_query->fetch_object()): 
                        $fecha_formateada = date('Y-m-d', strtotime($trabajo->fecha));
                    ?>
                        <tr>
                            <td><?php echo $trabajo->nombre; ?></td>
                            <td><?php echo $trabajo->archivo; ?></td>
                            <td><?php echo date('d/m/Y H:i', strtotime($trabajo->fecha)); ?></td>
                            <td>
                                <a href="../public/archivos/trabajos/<?php echo $trabajo->archivo; ?>" class="btn-action btn-download" download>
                                    <i class="fas fa-download"></i> Descargar
                                </a>
                                <a href="javascript:void(0)" onclick="confirmarEliminarTrabajo(<?php echo $trabajo->id_trabajo; ?>)" class="btn-action btn-delete" style="background-color: #e74c3c; color: white; margin-left: 5px;">
                                    <i class="fas fa-trash"></i> Eliminar
                                </a>
                            </td>
                        </tr>
                    <?php endwhile; ?>
                </tbody>
            </table>
        </div>
    <?php else: ?>
        <div class="empty-message">
            No se han recibido trabajos para este grado y sección.
        </div>
    <?php endif; ?>

</div>
<!-- fin del contenido principal -->

<!-- por ultimo se carga el footer -->
<?php require('./layout/footer.php'); ?>