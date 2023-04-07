<?php
session_start();
if (empty($_SESSION['nombre']) and empty($_SESSION['apellido'])) {
  header('location:login/login.php');
}
?>


<?php require('./layout/topbar.php'); ?>
<?php require('./layout/sidebar.php'); ?>

<?php
// session_start();
// if (empty($_SESSION['user']) and empty($_SESSION['clave'])) {
//     header('location:login/login.php');
// }

?>

<div class="page-content">

    PAGINA DE ACERCA DE

</div>
</div>



<?php require('./layout/footer.php'); ?>