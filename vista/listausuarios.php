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
<?php 
include("../modelo/conexion.php");
include("../controlador/controlador_eliminar_usuario.php");
$sql=$conexion->query("SELECT `usuarios`.*, `roles`.`rol`, `cargos`.`cargo`
FROM `usuarios` 
	LEFT JOIN `roles` ON `usuarios`.`idrol` = `roles`.`id` 
	LEFT JOIN `cargos` ON `usuarios`.`idcargo` = `cargos`.`id`;")
?>

<div class="page-content">
    <a href="registrousuario.php" class="btn btn-primary btn-rounded mb-2"><i class="fa-solid fa-plus"></i> &nbsp;Registrar</a>
    <table class="table table-bordered table-hover col-14" id="example">
     <thead>
       <tr>
      <th scope="col">Id Usuario</th>
      <th scope="col">Nombre Completo</th>
      <th scope="col">Rol</th>
      <th scope="col">Cargo</th>
      <th></th>
      
    </tr>
  </thead>
  <tbody>

  <?php 
  while ($datos = $sql->fetch_object()) { ?>
    <tr>
      <td><?= $datos->cedula?></th>
      <td><?= $datos->Nombre." ".$datos->apellidos?></td>
      <td><?= $datos->rol?></td>
      <td><?= $datos->cargo?></td>
      <td>
        <a href="listausuarios.php?id=<?=$datos->id?>" class="btn btn-danger">
        <i class="fa-solid fa-trash"></i>
        </a>
      </td>
    </tr>
  <?php }
  ?>


  </tbody>
</table>
</div>




 

<!-- por ultimo se carga el footer -->
<?php require('./layout/footer.php'); ?>