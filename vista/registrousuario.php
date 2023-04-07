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
 <h4>REGISTRO DE USUARIO</h4>

    <?php 
    include("../modelo/conexion.php");
    include("../controlador/controlador_registar_usuario.php");
    ?>

 <div class="row">
    <form action="" method="POST">
    <div class="fl-flex-label mb-4 px-2 col-12 col-md-6">
            <input type="text" placeholder="Cedula" class="input input__text" name="txtcedula">
        </div>
        <div class="fl-flex-label mb-4 px-2 col-12 col-md-6">
            <input type="text" placeholder="Nombre" class="input input__text" name="txtnombre">
        </div>
        
        <div class="fl-flex-label mb-4 px-2 col-12 col-md-6">
            <input type="text" placeholder="Apellidos" class="input input__text" name="txtapellido">
        </div>
        <div class="fl-flex-label mb-4 px-2 col-12 col-md-6">
            <input type="text" placeholder="Usuario" class="input input__text" name="txtusuario">
        </div>
        <div class="fl-flex-label mb-4 px-2 col-12 col-md-6">
            <input type="password" placeholder="Contraseña" class="input input__text" name="txtpassword">
        </div>
        
        <div class="fl-flex-label mb-4 px-2 col-12 col-md-6">
        <select class="form-select" aria-label="Default select example" name="sidrol">
                <option selected>Seleccion el rol</option>
                <option value="1">Superadmin</option>
                <option value="2">Admin</option>
                <option value="3">Usuario</option>
        </select>
        </div>
        <div class="fl-flex-label mb-4 px-2 col-12 col-md-6">
        <select class="form-select" aria-label="Default select example" name="sidsexo">
                <option selected>Sexo</option>
                <option value="1">Masculino</option>
                <option value="2">Femenino</option>
                <option value="3">Otros</option>
        </select>
        </div>
        <div class="fl-flex-label mb-4 px-2 col-12 col-md-6">
        <select class="form-select" aria-label="Default select example" name="scargo">
                <option selected>Cargo</option>
                <option value="1">Psicólogo(a)</option>
                <option value="2">Neuropsicólogo(a)</option>
                <option value="3">Profesional ABA</option>
        </select>
        </div>
        <div class="text-right pd-2">
            <a href="listausuarios.php" class="btn btn-secondary btn-rounded">Atras</a>
            <button name="btnregistar"value="ok" type="submit" class="btn btn-primary btn-rounded">Registar</button>
        </div>
       
    </form>
 </div>
</div>

<!-- fin del contenido principal -->
  
 

 

<!-- por ultimo se carga el footer -->
<?php require('./layout/footer.php'); ?>

