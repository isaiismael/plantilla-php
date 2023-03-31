<?php
session_start();
if (empty($_SESSION['nombre']) and empty($_SESSION['apellido'])) {
     header('location:login/login.php');
 }
?>

<!-- primero se carga el topbar -->
<?php require('./layout/topbar.php'); ?>
<!-- luego se carga el sidebar -->
<?php require('./layout/sidebar.php'); ?>

<!-- inicio del contenido principal -->


<div class="page-content">
<div style="display: flex; flex-direction: column; align-items: center; padding: 24px; background-color: #f5f5f5; border-radius: 8px; box-shadow: 0px 8px 16px rgba(0, 0, 0, 0.1);">
  <h2 style="font-size: 24px; margin-bottom: 24px;">Formulario</h2>
  <div style="display: flex; flex-direction: column; margin-bottom: 16px;">
    <label for="nombre" style="margin-bottom: 8px;">Nombre</label>
    <input type="text" id="nombre" name="nombre" style="padding: 8px 16px; border-radius: 4px; border: none; background-color: #fff;">
  </div>
  <div style="display: flex; flex-direction: column; margin-bottom: 16px;">
    <label for="identificacion" style="margin-bottom: 8px;">Identificación</label>
    <input type="text" id="identificacion" name="identificacion" style="padding: 8px 16px; border-radius: 4px; border: none; background-color: #fff;">
  </div>
  <div style="display: flex; flex-direction: column; margin-bottom: 16px;">
    <label for="grado" style="margin-bottom: 8px;">Grado</label>
    <input type="text" id="grado" name="grado" style="padding: 8px 16px; border-radius: 4px; border: none; background-color: #fff;">
  </div>
  <div style="display: flex; flex-direction: column; margin-bottom: 16px;">
    <label for="fecha-nacimiento" style="margin-bottom: 8px;">Fecha de nacimiento</label>
    <input type="date" id="fecha-nacimiento" name="fecha-nacimiento" style="padding: 8px 16px; border-radius: 4px; border: none; background-color: #fff;">
  </div>
  <div style="display: flex; flex-direction: column; margin-bottom: 16px;">
    <label for="fecha-entrevista" style="margin-bottom: 8px;">Fecha de entrevista</label>
    <input type="date" id="fecha-entrevista" name="fecha-entrevista" style="padding: 8px 16px; border-radius: 4px; border: none; background-color: #fff;">
  </div>
  <button type="submit" style="padding: 8px 16px; border-radius: 4px; border: none; background-color: #6200ee; color: #fff; font-size: 16px; cursor: pointer;">Enviar</button>
</div>
</div>




 

<!-- por ultimo se carga el footer -->
<?php require('./layout/footer.php'); ?>