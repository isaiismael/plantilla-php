<?php
session_start();
if (empty($_SESSION['id'])) {
  header('location:login/login.php');
  exit;
}
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
      background-color: #27ae60;
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
      background-color: #219955;
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

    .help-text {
      font-size: 12px;
      color: #777;
      margin-top: 5px;
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

  <a href="inicio.php" class="back-link">← Volver a la lista de grados</a>

  <div class="form-container">
    <h2 class="form-title">Registrar Nuevo Grado y Sección</h2>

    <form action="../controlador/procesar_registro_grado.php" method="POST">
      <div class="form-group">
        <label for="grado">Grado:</label>
        <input type="text" class="form-control" id="grado" name="grado" required>
        <div class="help-text">Puede ingresar cualquier texto para el grado</div>
      </div>

      <div class="form-group">
        <label for="seccion">Sección:</label>
        <input type="text" class="form-control" id="seccion" name="seccion" required>
        <div class="help-text">Puede ingresar cualquier texto para la sección</div>
      </div>

      <div class="form-group">
        <div class="estado-switch">
          <span class="switch-label">Estado:</span>
          <label class="switch">
            <input type="checkbox" name="estado" value="1" checked>
            <span class="slider"></span>
          </label>
          <span class="status-text">Habilitado</span>
        </div>
      </div>

      <div class="form-group">
        <button type="submit" class="btn-submit">Registrar Grado y Sección</button>
      </div>
    </form>
  </div>
</div>
<!-- fin del contenido principal -->

<!-- por ultimo se carga el footer -->
<?php require('./layout/footer.php'); ?>
