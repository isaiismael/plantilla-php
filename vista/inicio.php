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

    <table class="table" id="example">
     <thead>
       <tr>
      <th scope="col">Id Usuario</th>
      <th scope="col">Id Entrevistador</th>
      <th scope="col">Id Respuesta</th>
      <th scope="col">Respuesta</th>
      
    </tr>
  </thead>
  <tbody>
    <tr>
      <th scope="row">1</th>
      <td>Mark</td>
      <td>Otto</td>
      <td>@mdo</td>
    </tr>
    
  </tbody>
</table>
</div>

<!-- fin del contenido principal -->
  


 

<!-- por ultimo se carga el footer -->
<?php require('./layout/footer.php'); ?>

