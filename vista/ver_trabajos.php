<?php
session_start();
if (empty($_SESSION['id'])) {
  header('location:login/login.php');
}
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

    .section-title {
      color: #2c3e50;
      margin-bottom: 30px;
      font-size: 2rem;
      text-align: center;
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
      padding: 25px 30px;
      border-radius: 5px;
      text-align: center;
      font-size: 18px;
      margin-bottom: 15px;
      transition: all 0.3s ease;
      cursor: pointer;
      text-decoration: none;
      display: block;
    }

    .grade-title:hover {
      background-color: #2980b9;
      color: white;
      transform: translateY(-3px);
    }

    ul li:nth-child(3) .activo {
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

  <h2 class="section-title">Seleccione un Grado y Sección para Ver Trabajos</h2>

  <div class="grades-container">
    <?php
    include_once '../modelo/conexion.php';
    $grado_seccion = $conexion->query("SELECT gs.*, 
                                       (SELECT COUNT(*) FROM trabajo t WHERE t.id_grado_seccion = gs.id_grado_seccion) AS total_trabajos 
                                       FROM grado_seccion gs 
                                       WHERE estado='1' 
                                       ORDER BY grado, seccion");
    
    if ($grado_seccion->num_rows > 0) {
      while ($row = $grado_seccion->fetch_object()) {
        echo "<div class='grade-card'>";
        
        // Enlace directo al grado con el número de trabajos
        echo "<a href='trabajos_grado.php?id_grado_seccion={$row->id_grado_seccion}' class='grade-title'>";
        echo "{$row->grado}° {$row->seccion}";
        echo "<div style='margin-top: 10px; font-size: 14px;'>";
        echo "{$row->total_trabajos} trabajo" . ($row->total_trabajos != 1 ? "s" : "") . " recibido" . ($row->total_trabajos != 1 ? "s" : "");
        echo "</div>";
        echo "</a>";
        
        echo "</div>";
      }
    } else {
      echo "<div class='empty-message'>No hay grados y secciones habilitados disponibles</div>";
    }
    ?>
  </div>
</div>
<!-- fin del contenido principal -->

<!-- por ultimo se carga el footer -->
<?php require('./layout/footer.php'); ?>
