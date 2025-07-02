<?php
session_start();
if (empty($_SESSION['id'])) {
  header('location:login/login.php');
}

// Verificar si se ha proporcionado un ID
if (!isset($_GET['id'])) {
  $_SESSION['error'] = "No se ha especificado el archivo a editar.";
  header('location:subir_archivos.php');
  exit;
}

$id_archivo = intval($_GET['id']);

// Obtener información del archivo
include_once '../modelo/conexion.php';
$query = "SELECT a.*, g.grado, g.seccion FROM archivo_compartido a 
          JOIN grado_seccion g ON a.id_grado_seccion = g.id_grado_seccion 
          WHERE a.id_archivo_compartido = ?";

$stmt = $conexion->prepare($query);
$stmt->bind_param('i', $id_archivo);
$stmt->execute();
$resultado = $stmt->get_result();

if ($resultado->num_rows == 0) {
  $_SESSION['error'] = "El archivo no existe.";
  header('location:subir_archivos.php');
  exit;
}

$archivo = $resultado->fetch_object();
?>

<!-- primero se carga el topbar -->
<?php require('./layout/topbar.php'); ?>
<!-- luego se carga el sidebar -->
<?php require('./layout/sidebar.php'); ?>

<!-- inicio del contenido principal -->
<div class="page-content">
  <style>
    .upload-form-container {
      max-width: 800px;
      margin: 40px auto;
      padding: 25px;
      background-color: #fff;
      border-radius: 10px;
      box-shadow: 0 5px 15px rgba(0, 0, 0, 0.1);
    }

    .form-title {
      color: #2c3e50;
      margin-bottom: 20px;
      padding-bottom: 10px;
      border-bottom: 2px solid #eee;
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
      padding: 10px 15px;
      border: 1px solid #ddd;
      border-radius: 5px;
      font-size: 15px;
    }

    .form-control:focus {
      border-color: #3498db;
      box-shadow: 0 0 5px rgba(52, 152, 219, 0.3);
    }

    textarea.form-control {
      min-height: 120px;
      resize: vertical;
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

    .current-file-info {
      background-color: #f8f9fa;
      padding: 15px;
      border-radius: 5px;
      margin-bottom: 20px;
      border-left: 4px solid #3498db;
    }

    .file-label {
      font-weight: bold;
      color: #555;
    }

     ul li:nth-child(2) .activo {
      background: rgb(11, 150, 214) !important;
    }
  </style>

  <!-- Código para mostrar notificaciones con PNotify -->
  <script>
    document.addEventListener('DOMContentLoaded', function() {
      <?php if(isset($_SESSION['success'])): ?>
        new PNotify({
          title: 'Éxito',
          text: '<?php echo $_SESSION["success"]; ?>',
          type: 'success',
          styling: 'bootstrap3'
        });
        <?php unset($_SESSION['success']); ?>
      <?php endif; ?>

      <?php if(isset($_SESSION['error'])): ?>
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

  <a href="listar_archivos.php?id_grado_seccion=<?php echo $archivo->id_grado_seccion; ?>" class="back-link">← Volver a la lista de archivos</a>

  <div class="upload-form-container">
    <h3 class="form-title">Editar Archivo para <?php echo "{$archivo->grado}° {$archivo->seccion}"; ?></h3>

    <div class="current-file-info">
      <div><span class="file-label">Archivo actual:</span> <?php echo $archivo->archivo; ?></div>
      <div><span class="file-label">Subido el:</span> <?php echo date('d/m/Y H:i', strtotime($archivo->fecha)); ?></div>
    </div>

    <form action="../controlador/actualizar_archivo.php" method="POST" enctype="multipart/form-data">
      <input type="hidden" name="id_archivo" value="<?php echo $archivo->id_archivo_compartido; ?>">
      <input type="hidden" name="id_grado_seccion" value="<?php echo $archivo->id_grado_seccion; ?>">

      <div class="form-group">
        <label for="titulo">Título del Archivo:</label>
        <input type="text" class="form-control" id="titulo" name="titulo" value="<?php echo $archivo->titulo; ?>" required>
      </div>

      <div class="form-group">
        <label for="descripcion">Descripción:</label>
        <textarea class="form-control" id="descripcion" name="descripcion" rows="4"><?php echo $archivo->descripcion; ?></textarea>
      </div>

      <div class="form-group">
        <label for="archivo">Reemplazar Archivo (opcional):</label>
        <input type="file" class="form-control" id="archivo" name="archivo">
        <div class="file-info">Se permite cualquier tipo de archivo (sin límite de tamaño). Deje en blanco para mantener el archivo actual.</div>
      </div>

      <div class="form-group">
        <button type="submit" class="btn-submit">Actualizar Archivo</button>
      </div>
    </form>
  </div>
</div>
<!-- fin del contenido principal -->

<!-- por ultimo se carga el footer -->
<?php require('./layout/footer.php'); ?>
