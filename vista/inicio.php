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
<body>

<div class="page-content">
</div>

<!-- fin del contenido principal -->
  
</body>

 

<!-- por ultimo se carga el footer -->
<?php require('./layout/footer.php'); ?>

