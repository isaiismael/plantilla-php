<?php
// Iniciar sesión para poder mostrar notificaciones
session_start();

// Verificar si se ha seleccionado un grado_seccion
$id_grado_seccion = isset($_GET['id_grado_seccion']) ? intval($_GET['id_grado_seccion']) : 0;

if ($id_grado_seccion <= 0) {
    header('location:index.php');
    exit;
}

// Obtener información del grado seleccionado
include_once 'modelo/conexion.php';
$grado_query = $conexion->query("SELECT * FROM grado_seccion WHERE id_grado_seccion = $id_grado_seccion");
$grado_info = $grado_query->fetch_object();

// Verificar si el grado existe
if (!$grado_info) {
    $_SESSION['error'] = "El grado y sección seleccionado no existe.";
    header('location:index.php');
    exit;
}

// Verificar si el grado está activo
if ($grado_info->estado != '1') {
    $_SESSION['error'] = "El grado y sección seleccionado no está disponible actualmente.";
    header('location:index.php');
    exit;
}

// Obtener los archivos compartidos de este grado
$archivos_query = $conexion->query("SELECT * FROM archivo_compartido WHERE id_grado_seccion = $id_grado_seccion ORDER BY fecha DESC");

// Obtener los trabajos subidos para este grado
$trabajos_query = $conexion->query("SELECT * FROM trabajo WHERE id_grado_seccion = $id_grado_seccion ORDER BY fecha DESC");

// Identificar qué pestaña mostrar (por defecto: archivos)
$active_tab = isset($_GET['tab']) ? $_GET['tab'] : 'archivos';

?>

<!DOCTYPE html>
<html lang="es">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Archivos de <?php echo "{$grado_info->grado}° {$grado_info->seccion}"; ?></title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css">
    <!-- PNotify -->
    <link href="https://cdnjs.cloudflare.com/ajax/libs/pnotify/3.2.1/pnotify.css" rel="stylesheet">
    <link href="https://cdnjs.cloudflare.com/ajax/libs/pnotify/3.2.1/pnotify.buttons.css" rel="stylesheet">
    <link href="https://cdnjs.cloudflare.com/ajax/libs/pnotify/3.2.1/pnotify.brighttheme.css" rel="stylesheet">

    <style>
        body {
            font-family: 'Arial', sans-serif;
            background-color: #f5f5f5;
            padding: 20px;
        }

        .container {
            max-width: 1200px;
            margin: 0 auto;
            background-color: white;
            border-radius: 10px;
            box-shadow: 0 0 15px rgba(0, 0, 0, 0.1);
            padding: 30px;
        }

        h1 {
            color: #2c3e50;
            margin-bottom: 20px;
            font-size: 2.2rem;
            text-align: center;
        }

        .header-section {
            display: flex;
            justify-content: space-between;
            align-items: center;
            margin-bottom: 15px;
        }

        .back-button {
            background-color: #3498db;
            color: white;
            border: none;
            border-radius: 5px;
            padding: 10px 15px;
            text-decoration: none;
            font-weight: bold;
            transition: all 0.3s;
        }

        .back-button:hover {
            background-color: #2980b9;
            color: white;
        }

        .table {
            margin-top: 20px;
            box-shadow: 0 2px 10px rgba(0, 0, 0, 0.1);
        }

        .table th {
            background-color: #3498db;
            color: white;
        }

        .btn-action {
            margin-right: 5px;
        }

        .section-title {
            color: #2c3e50;
            margin: 20px 0 15px 0;
            padding-bottom: 10px;
            border-bottom: 2px solid #eee;
        }

        .upload-form {
            background-color: #f9f9f9;
            padding: 20px;
            border-radius: 8px;
            margin-top: 20px;
        }

        .no-records {
            background-color: #f8f9fa;
            padding: 15px;
            border-radius: 5px;
            text-align: center;
            color: #6c757d;
            margin-top: 20px;
        }

        /* Nuevos estilos para las pestañas */
        .nav-tabs {
            margin-bottom: 20px;
            border-bottom: 2px solid #e9ecef;
        }

        .nav-tabs .nav-link {
            border: none;
            color: #6c757d;
            font-weight: bold;
            padding: 12px 20px;
            border-radius: 0;
            margin-right: 5px;
            transition: all 0.3s;
        }

        .nav-tabs .nav-link.active {
            color: #3498db;
            border-bottom: 3px solid #3498db;
            background-color: transparent;
        }

        .nav-tabs .nav-link:hover:not(.active) {
            background-color: #f8f9fa;
            border-color: transparent;
        }

        .tab-content {
            padding: 20px 0;
        }

        .tab-pane {
            animation: fadeIn 0.5s;
        }

        @keyframes fadeIn {
            from {
                opacity: 0;
            }

            to {
                opacity: 1;
            }
        }

        .tab-badge {
            background-color: #3498db;
            color: white;
            padding: 3px 8px;
            border-radius: 50px;
            font-size: 12px;
            margin-left: 5px;
        }

        .quick-actions {
            display: flex;
            gap: 10px;
            margin-top: 15px;
            justify-content: center;
        }

        .quick-btn {
            display: flex;
            align-items: center;
            gap: 5px;
            padding: 10px 15px;
            border-radius: 5px;
            color: white;
            text-decoration: none;
            font-weight: bold;
            transition: all 0.3s;
        }

        .quick-btn:hover {
            transform: translateY(-2px);
            color: white;
        }

        .upload-btn {
            background-color: #27ae60;
        }

        .upload-btn:hover {
            background-color: #219955;
        }
    </style>
</head>

<body>
    <div class="container">
        <div class="header-section">
            <h1>Archivos de <?php echo "{$grado_info->grado}° {$grado_info->seccion}"; ?></h1>
            <a href="index.php" class="back-button"><i class="fas fa-arrow-left"></i> Volver a la selección de grados</a>
        </div>

        <!-- Quick action buttons -->
        <div class="quick-actions">
            <a href="#upload-form" class="quick-btn upload-btn">
                <i class="fas fa-upload"></i> Entregar trabajo rápidamente
            </a>
        </div>

        <!-- Pestañas de navegación -->
        <ul class="nav nav-tabs" id="myTab" role="tablist">
            <li class="nav-item" role="presentation">
                <a class="nav-link <?php echo $active_tab == 'archivos' ? 'active' : ''; ?>"
                    id="archivos-tab" data-bs-toggle="tab" href="#archivos" role="tab"
                    aria-controls="archivos" aria-selected="<?php echo $active_tab == 'archivos' ? 'true' : 'false'; ?>">
                    Archivos compartidos
                    <span class="tab-badge"><?php echo $archivos_query->num_rows; ?></span>
                </a>
            </li>
            <li class="nav-item" role="presentation">
                <a class="nav-link <?php echo $active_tab == 'trabajos' ? 'active' : ''; ?>"
                    id="trabajos-tab" data-bs-toggle="tab" href="#trabajos" role="tab"
                    aria-controls="trabajos" aria-selected="<?php echo $active_tab == 'trabajos' ? 'true' : 'false'; ?>">
                    Mis trabajos entregados
                    <span class="tab-badge"><?php echo $trabajos_query->num_rows; ?></span>
                </a>
            </li>
            <li class="nav-item" role="presentation">
                <a class="nav-link <?php echo $active_tab == 'entregar' ? 'active' : ''; ?>"
                    id="entregar-tab" data-bs-toggle="tab" href="#entregar" role="tab"
                    aria-controls="entregar" aria-selected="<?php echo $active_tab == 'entregar' ? 'true' : 'false'; ?>">
                    Entregar nuevo trabajo
                </a>
            </li>
        </ul>

        <!-- Contenido de las pestañas -->
        <div class="tab-content" id="myTabContent">
            <!-- Pestaña de archivos compartidos -->
            <div class="tab-pane fade <?php echo $active_tab == 'archivos' ? 'show active' : ''; ?>" id="archivos" role="tabpanel" aria-labelledby="archivos-tab">
                <?php if ($archivos_query->num_rows > 0): ?>
                    <div class="table-responsive">
                        <table class="table table-striped">
                            <thead>
                                <tr>
                                    <th>Título</th>
                                    <th>Descripción</th>
                                    <th>Fecha</th>
                                    <th>Acciones</th>
                                </tr>
                            </thead>
                            <tbody>
                                <?php while ($archivo = $archivos_query->fetch_object()): ?>
                                    <tr>
                                        <td><?php echo $archivo->titulo; ?></td>
                                        <td><?php echo $archivo->descripcion ? $archivo->descripcion : "<em>Sin descripción</em>"; ?></td>
                                        <td><?php echo date('d/m/Y H:i', strtotime($archivo->fecha)); ?></td>
                                        <td>
                                            <a href="public/archivos/compartido/<?php echo $archivo->archivo; ?>" class="btn btn-success btn-sm btn-action" download>
                                                <i class="fas fa-download"></i> Descargar
                                            </a>
                                        </td>
                                    </tr>
                                <?php endwhile; ?>
                            </tbody>
                        </table>
                    </div>
                <?php else: ?>
                    <div class="no-records">No hay archivos compartidos disponibles para este grado y sección.</div>
                <?php endif; ?>
            </div>

            <!-- Pestaña de trabajos entregados -->
            <div class="tab-pane fade <?php echo $active_tab == 'trabajos' ? 'show active' : ''; ?>" id="trabajos" role="tabpanel" aria-labelledby="trabajos-tab">
                <?php if ($trabajos_query->num_rows > 0): ?>
                    <div class="table-responsive">
                        <table class="table table-striped">
                            <thead>
                                <tr>
                                    <th>Nombre del trabajo</th>
                                    <th>Fecha de entrega</th>
                                    <th>Acciones</th>
                                </tr>
                            </thead>
                            <tbody>
                                <?php while ($trabajo = $trabajos_query->fetch_object()): ?>
                                    <tr>
                                        <td><?php echo $trabajo->nombre; ?></td>
                                        <td><?php echo date('d/m/Y H:i', strtotime($trabajo->fecha)); ?></td>
                                        <td>
                                            <!-- <a href="public/archivos/trabajos/<?php echo $trabajo->archivo; ?>" class="btn btn-info btn-sm btn-action" download>
                                                <i class="fas fa-download"></i> Descargar
                                            </a> -->
                                        </td>
                                    </tr>
                                <?php endwhile; ?>
                            </tbody>
                        </table>
                    </div>
                <?php else: ?>
                    <div class="no-records">No has entregado ningún trabajo para este grado y sección.</div>
                <?php endif; ?>
            </div>

            <!-- Pestaña de entregar trabajo -->
            <div class="tab-pane fade <?php echo $active_tab == 'entregar' ? 'show active' : ''; ?>" id="entregar" role="tabpanel" aria-labelledby="entregar-tab">
                <div id="upload-form" class="upload-form">
                    <form action="controlador/procesar_trabajo.php" method="POST" enctype="multipart/form-data">
                        <input type="hidden" name="id_grado_seccion" value="<?php echo $id_grado_seccion; ?>">

                        <div class="mb-3">
                            <label for="nombre" class="form-label">Nombre del trabajo:</label>
                            <input type="text" class="form-control" id="nombre" name="nombre" required>
                        </div>

                        <div class="mb-3">
                            <label for="archivo" class="form-label">Seleccionar archivo:</label>
                            <input type="file" class="form-control" id="archivo" name="archivo" required>
                            <div class="form-text">Puedes subir cualquier tipo de archivo sin límite de tamaño</div>
                        </div>

                        <button type="submit" class="btn btn-primary">Entregar trabajo</button>
                    </form>
                </div>
            </div>
        </div>
    </div>

    <!-- JavaScript -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>

    <!-- PNotify -->
    <script src="https://cdnjs.cloudflare.com/ajax/libs/pnotify/3.2.1/pnotify.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/pnotify/3.2.1/pnotify.buttons.js"></script>

    <script>
        $(document).ready(function() {
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

            // Botón de acción rápida para ir al formulario
            $('.upload-btn').click(function(e) {
                e.preventDefault();
                $('#entregar-tab').tab('show');
                $('html, body').animate({
                    scrollTop: $("#upload-form").offset().top - 100
                }, 500);
            });
        });
    </script>
</body>

</html>