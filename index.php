<?php
// Iniciar sesión para poder acceder a las notificaciones
session_start();
?>
<!DOCTYPE html>
<html lang="es">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Sistema Escolar - Selección de Grado</title>
    <!-- Añadir PNotify -->
    <link href="https://cdnjs.cloudflare.com/ajax/libs/pnotify/3.2.1/pnotify.css" rel="stylesheet">
    <link href="https://cdnjs.cloudflare.com/ajax/libs/pnotify/3.2.1/pnotify.buttons.css" rel="stylesheet">
    <link href="https://cdnjs.cloudflare.com/ajax/libs/pnotify/3.2.1/pnotify.brighttheme.css" rel="stylesheet">
    <style>
        body {
            font-family: 'Arial', sans-serif;
            background-color: #f5f5f5;
            margin: 0;
            padding: 20px;
        }
        
        .container {
            max-width: 1000px;
            margin: 0 auto;
            text-align: center;
        }
        
        h1 {
            color: #2c3e50;
            margin-bottom: 30px;
            font-size: 2.2rem;
        }
        
        .grades-container {
            display: flex;
            flex-wrap: wrap;
            justify-content: center;
            gap: 20px;
            margin-top: 40px;
        }
        
        .grade-button {
            background-color: #3498db;
            color: white;
            border: none;
            border-radius: 10px;
            padding: 30px 20px;
            font-size: 18px;
            cursor: pointer;
            transition: all 0.3s ease;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            text-decoration: none;
            min-width: 200px;
            display: flex;
            flex-direction: column;
            align-items: center;
            justify-content: center;
        }
        
        .grade-button:hover {
            background-color: #2980b9;
            transform: translateY(-5px);
            box-shadow: 0 8px 15px rgba(0, 0, 0, 0.2);
        }
        
        .grade-name {
            font-size: 24px;
            font-weight: bold;
            margin-bottom: 12px;
        }
        
        .file-stats {
            display: flex;
            justify-content: space-around;
            width: 100%;
            margin-top: 15px;
            font-size: 14px;
        }
        
        .stat-item {
            display: flex;
            flex-direction: column;
            align-items: center;
        }
        
        .stat-number {
            font-size: 18px;
            font-weight: bold;
            margin-bottom: 3px;
        }
        
        .stat-label {
            font-size: 12px;
            opacity: 0.9;
        }
        
        .empty-message {
            color: #e74c3c;
            font-size: 18px;
            padding: 20px;
            background-color: #fdeaea;
            border-radius: 8px;
            display: inline-block;
            margin-top: 30px;
        }
        
        .login-button {
            background-color: #27ae60;
            color: white;
            border: none;
            border-radius: 8px;
            padding: 12px 25px;
            font-size: 16px;
            cursor: pointer;
            transition: all 0.3s ease;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            text-decoration: none;
            margin-bottom: 30px;
            display: inline-block;
        }
        
        .login-button:hover {
            background-color: #219653;
            transform: translateY(-3px);
            box-shadow: 0 6px 12px rgba(0, 0, 0, 0.15);
        }
    </style>
</head>

<body>
    <div class="container">
        <h1>Selecciona tu Grado y Sección</h1>
        
        <a href="vista/inicio.php" class="login-button">Iniciar Sesión Docente</a>
        
        <div class="grades-container">
            <?php
            include_once 'modelo/conexion.php';
            $grado_seccion = $conexion->query("SELECT gs.*, 
                (SELECT COUNT(*) FROM archivo_compartido WHERE id_grado_seccion = gs.id_grado_seccion) AS archivos_compartidos,
                (SELECT COUNT(*) FROM trabajo WHERE id_grado_seccion = gs.id_grado_seccion) AS trabajos_subidos 
                FROM grado_seccion gs 
                WHERE gs.estado='1' 
                ORDER BY gs.grado, gs.seccion");
                
            if ($grado_seccion->num_rows > 0) {
                while ($row = $grado_seccion->fetch_object()) {
                    echo "<a href='mis_archivos.php?id_grado_seccion={$row->id_grado_seccion}' class='grade-button'>";
                    echo "<div class='grade-name'>{$row->grado}° {$row->seccion}</div>";
                    
                    // Estadísticas de archivos
                    echo "<div class='file-stats'>";
                    echo "<div class='stat-item'>";
                    echo "<div class='stat-number'>{$row->archivos_compartidos}</div>";
                    echo "<div class='stat-label'>Archivos<br>compartidos</div>";
                    echo "</div>";
                    
                    echo "<div class='stat-item'>";
                    echo "<div class='stat-number'>{$row->trabajos_subidos}</div>";
                    echo "<div class='stat-label'>Trabajos<br>subidos</div>";
                    echo "</div>";
                    echo "</div>";
                    
                    echo "</a>";
                }
            } else {
                echo "<div class='empty-message'>No hay grados y secciones disponibles</div>";
            }
            ?>
        </div>
    </div>
    
    <!-- JavaScript y PNotify -->
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/pnotify/3.2.1/pnotify.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/pnotify/3.2.1/pnotify.buttons.js"></script>
    
    <script>
        $(document).ready(function() {
            <?php if(isset($_SESSION['success'])): ?>
                new PNotify({
                    title: 'Éxito',
                    text: '<?php echo $_SESSION["success"]; ?>',
                    type: 'success',
                    styling: 'brighttheme'
                });
                <?php unset($_SESSION['success']); ?>
            <?php endif; ?>

            <?php if(isset($_SESSION['error'])): ?>
                new PNotify({
                    title: 'Error',
                    text: '<?php echo $_SESSION["error"]; ?>',
                    type: 'error',
                    styling: 'brighttheme'
                });
                <?php unset($_SESSION['error']); ?>
            <?php endif; ?>
        });
    </script>
</body>
</html>