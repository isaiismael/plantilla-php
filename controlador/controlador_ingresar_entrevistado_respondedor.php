<?php
if (
    !empty($_POST["nombreaso"]) and !empty($_POST["Telefonoaso"]) and !empty($_POST["identificacionaso"])
    and !empty($_POST["generoaso"]) and !empty($_POST["relacionaso"])
) {
    $_SESSION["nombreaso"] = $_POST["nombreaso"];
    $_SESSION["identificacionaso"] = $_POST["identificacionaso"];
    $_SESSION["Telefonoaso"] = $_POST["Telefonoaso"];
    $_SESSION["generoaso"] = $_POST["generoaso"];
    $_SESSION["relacionaso"] = $_POST["relacionaso"];
    
 //   $resultado = $conexion->query("insert into respondedor (idrespondet,nombreResponden,sexoresponden, telefonoresponden, id_relacion)
   //         values ('$identificacion', '$nombre','$generoaso','$tefonoaso','$relacionaso')");

} 
?>