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
<?php include("../modelo/conexion.php"); ?>

 <!-- <script src="../vista/inicio/js/Entrevistado.js"></script> -->


<div class="page-content">

  <form method="POST" id="datos_entrevistado" action="receptiva.php">
    <div style="display: flex; flex-direction: column; align-items: center; padding: 24px; background-color: #f5f5f5; border-radius: 8px; box-shadow: 0px 8px 16px rgba(0, 0, 0, 0.1);">
      <h2 style="font-size: 24px; margin-bottom: 24px;">Formulario</h2>
      <div style="display: flex; flex-direction: column; margin-bottom: 16px; width: 50%;" name="div-nombre">
        <label for="nombre" style="margin-bottom: 8px;">Nombre Completo</label>
        <input type="text" id="nombre" name="nombre" style="padding: 8px 16px; border-radius: 4px; border: none; background-color: #fff;">
      </div>
      <div style="display: flex; flex-direction: column; margin-bottom: 16px; width: 50%;" name="div-identificacion">
        <label for="identificacion" style="margin-bottom: 8px;">Identificación</label>
        <input type="text" id="identificacion" name="identificacion" style="padding: 8px 16px; border-radius: 4px; border: none; background-color: #fff;">
      </div>
      <div style="display: flex; flex-direction: column; margin-bottom: 16px; width: 50%;" name="div-grado">
        <label for="grado" style="margin-bottom: 8px;">Grado</label>
        <input type="text" id="grado" name="grado" style="padding: 8px 16px; border-radius: 4px; border: none; background-color: #fff;">
      </div>
      <div style="display: flex; flex-direction: column; margin-bottom: 16px; width: 50%;" name="div-grado">
        <label for="grado" style="margin-bottom: 8px;">Ciudad</label>
        <input type="text" id="Cuidad" name="grado" style="padding: 8px 16px; border-radius: 4px; border: none; background-color: #fff;">
      </div>
      <div style="display: flex; flex-direction: column; margin-bottom: 16px; width: 50%;" name="div-grado">
        <label for="grado" style="margin-bottom: 8px;">Direccion</label>
        <input type="text" id="Direccion" name="grado" style="padding: 8px 16px; border-radius: 4px; border: none; background-color: #fff;">
      </div>
      <div style="display: flex; flex-direction: column; margin-bottom: 16px; width: 50%;" name="div-grado">
        <label for="grado" style="margin-bottom: 8px;">Telefono</label>
        <input type="text" id="Telefono" style="padding: 8px 16px; border-radius: 4px; border: none; background-color: #fff;">
      </div>
      <div style="display: flex; flex-direction: column; margin-bottom: 16px; width: 50%;" name="div-grado">
        <label for="Colegio" style="margin-bottom: 8px;">Colegio/Institucion</label>
        <input type="text" id="Colegio" style="padding: 8px 16px; border-radius: 4px; border: none; background-color: #fff;">
      </div>
      <div style="display: flex; flex-direction: column; margin-bottom: 16px; width: 80%;" name="div-grado">
        <label for="Colegio" style="margin-bottom: 8px;">Razon para la entrevista</label>
        <textarea id="razonentrevista" rows="5" cols="50" style="resize:none;"></textarea>
      </div>
      <div style="display: flex; flex-direction: column; margin-bottom: 16px;">
        <label for="grado" style="margin-bottom: 8px;">Edad</label>
        <input type="text" id="edad" name="edad" style="padding: 8px 16px; border-radius: 4px; border: none; background-color: #fff;">
      </div>
      <div style="display: flex; flex-direction: row; margin-bottom: 16px;">
        <label for="grado" style="margin-bottom: 8px;">Sexo</label>
        <input type="radio" id="genero" name="genero" value="1" style="padding: 8px 16px; border-radius: 4px; border: none; background-color: #fff;"> Masculino
        <input type="radio" id="genero" name="genero" value="2" style="padding: 8px 16px; border-radius: 4px; border: none; background-color: #fff;"> Femenino
      </div>
      <div style="display: flex; flex-direction: column; margin-bottom: 16px;">
        <label for="fecha-nacimiento" style="margin-bottom: 8px;">Fecha de nacimiento</label>
        <input type="date" name="fecha-nacimiento" style="padding: 8px 16px; border-radius: 4px; border: none; background-color: #fff;">
      </div>
      <div style="display: flex; flex-direction: column; margin-bottom: 16px;">
        <label for="fecha-entrevista" style="margin-bottom: 8px;">Fecha de entrevista</label>
        <input type="date" name="fecha-entrevista" style="padding: 8px 16px; border-radius: 4px; border: none; background-color: #fff;">
      </div>
      <div class="linea" style="border-top: 5px solid #000; height: 2px; max-width: 200px; padding: 0; margin: 20px auto 0 auto;"></div>
      <h2 style="font-size: 24px; margin-bottom: 24px;">Acerca del Entrevistado</h2>
      <div style="display: flex; flex-direction: column; margin-bottom: 16px; width: 50%;" name="div-nombre">
        <label for="nombre" style="margin-bottom: 8px;">Nombre Completo</label>
        <input type="text" name="nombreaso" style="padding: 8px 16px; border-radius: 4px; border: none; background-color: #fff;">
      </div>
      <div style="display: flex; flex-direction: column; margin-bottom: 16px; width: 50%;" name="div-identificacion">
        <label for="identificacion" style="margin-bottom: 8px;">Identificación</label>
        <input type="text" name="identificacionaso" style="padding: 8px 16px; border-radius: 4px; border: none; background-color: #fff;">
      </div>
      <div style="display: flex; flex-direction: column; margin-bottom: 16px; width: 50%;" name="div-grado">
        <label for="grado" style="margin-bottom: 8px;">Telefono</label>
        <input type="text" name="Telefonoaso" style="padding: 8px 16px; border-radius: 4px; border: none; background-color: #fff;">
      </div>
      <div style="display: flex; flex-direction: row; margin-bottom: 16px;">
        <label for="grado" style="margin-bottom: 8px;">Sexo</label>
        <input type="radio" name="generoaso" value="1" style="padding: 8px 16px; border-radius: 4px; border: none; background-color: #fff;"> Masculino
        <input type="radio" name="generoaso" value="2" style="padding: 8px 16px; border-radius: 4px; border: none; background-color: #fff;"> Femenino
      </div>
      <div style="display: flex; flex-direction: row; margin-bottom: 16px;">
        <select class="form-select" aria-label="Default select example" name="relacionaso">
          <option selected>Relacion con el Entrevistado</option>
          <option value="1">Madre</option>
          <option value="2">Padre</option>
          <option value="3">Hijo</option>
          <option value="4">Hermano</option>
          <option value="5">Hermana</option>
          <option value="6">Tio</option>
          <option value="7">Tia</option>
          <option value="8">Prima</option>
          <option value="9">Primo</option>
          <option value="10">Madrastra</option>
          <option value="11">Padastro</option>
          <option value="12">Familiar</option>
          <option value="13">Otro</option>
        </select>
      </div>
      <div class="dropdown-divider"></div>
      <div style="display: flex; flex-direction: row; margin-bottom: 16px;">
        <button id="btnentrevistado" type="submit" value="ok" class="btn btn-primary btn-rounded"">Enviar</button>
    </div>
    </div>
    <?php include("../controlador/controlador_ingresar_entrevistado_respondedor.php"); ?>
  </form>

</div>






<!-- por ultimo se carga el footer -->
<?php require('./layout/footer.php'); ?>