<!DOCTYPE html>
<html lang="es">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Sistema Escolar - Selección de Grado</title>
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
            padding: 45px 50px;
            font-size: 18px;
            cursor: pointer;
            transition: all 0.3s ease;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            text-decoration: none;
            min-width: 200px;
        }
        
        .grade-button:hover {
            background-color: #2980b9;
            transform: translateY(-5px);
            box-shadow: 0 8px 15px rgba(0, 0, 0, 0.2);
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
            $grado_seccion = $conexion->query("select * from grado_seccion where estado='1' order by grado, seccion");
            if ($grado_seccion->num_rows > 0) {
                while ($row = $grado_seccion->fetch_object()) {
                    echo "<a href='vista/inicio.php?id_grado_seccion={$row->id_grado_seccion}' class='grade-button'>";
                    echo "{$row->grado} {$row->seccion}";
                    echo "</a>";
                }
            } else {
                echo "<div class='empty-message'>No hay grados y secciones disponibles</div>";
            }
            ?>
        </div>
    </div>
</body>
</html>