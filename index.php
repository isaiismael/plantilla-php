<?php
session_start();
if (empty($_SESSION['user']) and empty($_SESSION['clave'])) {
    header('location:./vista/login/login.php');
}else{
/* consulta para los datos en e inicio */
//include './modelo/conexion.php';

// $codigo = $_SESSION['id'];
// $consulta2 = $conexion->query(" select *from usuario where id_usuario=$codigo ");
// $datos2 = $consulta2->fetch_object();
header('location:./vista/inicio.php');
}
