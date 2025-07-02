<?php
session_start();
if (empty($_SESSION['id'])) {
  header('location:login/login.php');
}

// Verificar si se ha seleccionado un grado_seccion
$id_grado_seccion_seleccionado = isset($_GET['id_grado_seccion']) ? intval($_GET['id_grado_seccion']) : 0;

?>

<!-- primero se carga el topbar -->
<?php require('./layout/topbar.php'); ?>
<!-- luego se carga el sidebar -->
<?php require('./layout/sidebar.php'); ?>

<!-- inicio del contenido principal -->
<div class="page-content">
  <style>
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
      display: flex;
      align-items: center;
      justify-content: center;
    }

    .grade-button:hover {
      background-color: #2980b9;
      transform: translateY(-5px);
      box-shadow: 0 8px 15px rgba(0, 0, 0, 0.2);
      color: white;
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

    .section-title {
      color: #2c3e50;
      margin-bottom: 30px;
      font-size: 2rem;
      text-align: center;
    }

    /* Estilos para el contenedor de grado-sección */
    .grade-section-container {
      display: flex;
      flex-direction: column;
      align-items: center;
      gap: 10px;
      margin-bottom: 10px;
    }

    /* Estilos para el switch toggle */
    .switch {
      position: relative;
      display: inline-block;
      width: 60px;
      height: 30px;
    }

    .switch input {
      opacity: 0;
      width: 0;
      height: 0;
    }

    .slider {
      position: absolute;
      cursor: pointer;
      top: 0;
      left: 0;
      right: 0;
      bottom: 0;
      background-color: #ccc;
      transition: .4s;
      border-radius: 34px;
    }

    .slider:before {
      position: absolute;
      content: "";
      height: 22px;
      width: 22px;
      left: 4px;
      bottom: 4px;
      background-color: white;
      transition: .4s;
      border-radius: 50%;
    }

    input:checked+.slider {
      background-color: #2196F3;
    }

    input:focus+.slider {
      box-shadow: 0 0 1px #2196F3;
    }

    input:checked+.slider:before {
      transform: translateX(30px);
    }

    .status-text {
      font-size: 12px;
      font-weight: bold;
      margin-top: 5px;
    }

    .disabled-grade {
      opacity: 0.3;
      pointer-events: none;
    }


    /* Estilos para el formulario de subida */
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

    .selected-grade {
      margin-top: 20px;
      background-color: #e8f4f8;
      padding: 10px 15px;
      border-radius: 5px;
      display: inline-block;
      font-weight: bold;
      border-left: 4px solid #3498db;
    }

    .back-button {
      display: inline-block;
      margin-bottom: 20px;
      color: #3498db;
      text-decoration: none;
      font-weight: bold;
    }

    .back-button:hover {
      text-decoration: underline;
    }

    .file-info {
      margin-top: 5px;
      font-size: 12px;
      color: #777;
    }

    ul li:nth-child(2) .activo {
      background: rgb(11, 150, 214) !important;
    }

    /* Nuevos estilos para los botones de acción */
    .grade-actions {
      display: flex;
      gap: 10px;
      margin-top: 10px;
    }

    .action-button {
      padding: 8px 15px;
      border-radius: 5px;
      color: white;
      text-decoration: none;
      font-size: 14px;
      font-weight: bold;
      text-align: center;
      transition: all 0.3s ease;
      flex: 1;
    }

    .list-button {
      background-color: #27ae60;
    }

    .list-button:hover {
      background-color: #219955;
      color: white;
    }

    .upload-button {
      background-color: #e67e22;
    }

    .upload-button:hover {
      background-color: #d35400;
      color: white;
    }

    .grade-card {
      background-color: white;
      border-radius: 10px;
      box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
      padding: 20px;
      display: flex;
      flex-direction: column;
      min-width: 220px;
      transition: all 0.3s ease;
    }

    .grade-card:hover {
      box-shadow: 0 8px 15px rgba(0, 0, 0, 0.2);
      transform: translateY(-5px);
    }

    .grade-title {
      background-color: #3498db;
      color: white;
      padding: 15px;
      border-radius: 5px;
      text-align: center;
      font-size: 18px;
      margin-bottom: 15px;
    }

    /* Estilos para la tabla de archivos */
    .file-table {
      width: 100%;
      border-collapse: collapse;
      margin-top: 20px;
    }

    .file-table th,
    .file-table td {
      border: 1px solid #ddd;
      padding: 12px;
      text-align: left;
    }

    .file-table th {
      background-color: #f2f2f2;
      color: #333;
    }

    .file-table tr:nth-child(even) {
      background-color: #f9f9f9;
    }

    .file-table tr:hover {
      background-color: #f5f5f5;
    }

    .action-icon {
      color: #3498db;
      margin-right: 10px;
      font-size: 16px;
    }

    .delete-icon {
      color: #e74c3c;
    }

    .back-to-grades {
      margin-bottom: 20px;
      display: inline-block;
      color: #3498db;
      text-decoration: none;
      font-weight: bold;
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

  <?php if ($id_grado_seccion_seleccionado <= 0): ?>
    <!-- Mostrar la selección de grados cuando no hay ninguno seleccionado -->
    <h2 class="section-title">Seleccione un Grado y Sección para Gestionar Archivos</h2>

    <div class="grades-container">
      <?php
      include_once '../modelo/conexion.php';
      $grado_seccion = $conexion->query("SELECT * FROM grado_seccion WHERE estado='1' ORDER BY grado, seccion");
      if ($grado_seccion->num_rows > 0) {
        while ($row = $grado_seccion->fetch_object()) {
          echo "<div class='grade-card'>";
          
          // Título del grado
          echo "<div class='grade-title'>{$row->grado}° {$row->seccion}</div>";
          
          // Botones de acción
          echo "<div class='grade-actions'>";
          echo "<a href='listar_archivos.php?id_grado_seccion={$row->id_grado_seccion}' class='action-button list-button'>Ver Archivos</a>";
          echo "<a href='subir_archivos.php?id_grado_seccion={$row->id_grado_seccion}' class='action-button upload-button'>Subir Archivo</a>";
          echo "</div>";
          
          echo "</div>";
        }
      } else {
        echo "<div class='empty-message'>No hay grados y secciones habilitados disponibles</div>";
      }
      ?>
    </div>

  <?php else: ?>
    <!-- Mostrar el formulario de subida cuando hay un grado seleccionado -->
    <?php
    include_once '../modelo/conexion.php';
    $grado_seleccionado = $conexion->query("SELECT * FROM grado_seccion WHERE id_grado_seccion = $id_grado_seccion_seleccionado");
    $row_grado = $grado_seleccionado->fetch_object();
    ?>


    <div class="selected-grade">
      Grado y sección seleccionado: <?php echo "{$row_grado->grado}° {$row_grado->seccion}"; ?>
    </div>

    <div class="upload-form-container">
      <h3 class="form-title">Subir Archivo para <?php echo "{$row_grado->grado}° {$row_grado->seccion}"; ?></h3>

      <form action="../controlador/procesar_archivo.php" method="POST" enctype="multipart/form-data">
        <input type="hidden" name="id_grado_seccion" value="<?php echo $id_grado_seccion_seleccionado; ?>">

        <div class="form-group">
          <label for="titulo">Título del Archivo:</label>
          <input type="text" class="form-control" id="titulo" name="titulo" required>
        </div>

        <div class="form-group">
          <label for="descripcion">Descripción:</label>
          <textarea class="form-control" id="descripcion" name="descripcion" rows="4"></textarea>
        </div>

        <div class="form-group">
          <label for="archivo">Seleccionar Archivo:</label>
          <input type="file" class="form-control" id="archivo" name="archivo" required>
          <div class="file-info">Se permite cualquier tipo de archivo (sin límite de tamaño)</div>
        </div>

        <div class="form-group">
          <button type="submit" class="btn-submit">Subir Archivo</button>
        </div>
      </form>
    </div>
  <?php endif; ?>

</div>
<!-- fin del contenido principal -->

<!-- por ultimo se carga el footer -->
<?php require('./layout/footer.php'); ?>