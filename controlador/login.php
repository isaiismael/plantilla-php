<?php

session_start();

if (!empty($_POST["btningresar"])) {
    if (!empty($_POST["usuario"]) and !empty($_POST["password"])) {
        $usuario = $_POST["usuario"];
        $password = md5($_POST["password"]);
        $sql = $conexion->query(" select * from usuario where usuario='$usuario' and clave='$password' ");
        if ($datos = $sql->fetch_object()) {
            $_SESSION["nombre"] = $datos->nombres;
            $_SESSION["apellido"] = $datos->apellidos;
            $_SESSION["id"] = $datos->id_usuario;
            header("location:../inicio.php");
        } else {
            echo "<div class='alert alert-danger'>El usuario no existe</div>";
        }
    } else {
        echo "<div class='alert alert-danger'>Los campos estan vacíos</div>";
    }
}
