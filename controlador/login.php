<?php

session_start();

if (!empty($_POST["btningresar"])) {
    if (!empty($_POST["usuario"]) and !empty($_POST["password"])) {
        $usuario = $_POST["usuario"];
        $password = $_POST["password"];

        $sql = $conexion->query(" select * from usuarios where usuario='$usuario' and contraseña='$password'");
        if ($datos = $sql->fetch_object()) {
            $_SESSION["nombre"] = $datos->Nombre;
            $_SESSION["apellido"] = $datos->apellidos;
            $_SESSION["id_usuario"] = $datos->id;
            $_SESSION["idrol"]= $datos->idrol;
            switch ($datos->idrol) {
                case 1 :
                    header("location:../acerca.php");
                    break;
                case 2 :
                    header("location:../registroentrevistado.php");
                    break;
                case 3 :
                    header("location:../registroentrevistado.php");
            }
            
               
        } else {
            echo "<div class='alert alert-danger'> los campos son incorrectos</div>";
        }
    } else {
        echo "<div class='alert alert-danger'> los campos estan vacios</div>";
    }
}
