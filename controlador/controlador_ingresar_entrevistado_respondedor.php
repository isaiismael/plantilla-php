<?php
$identificacion= $_SESSION["idrespondedor"];
$nombre=$_SESSION["nombreresopondedor"];
$generoaso=$_SESSION["sexorespondedor"];
$tefonoaso=$_SESSION["relacion"];
$relacionaso=$_SESSION["telefonorespondedor"];

 $resultado = $conexion->query("insert into respondedor (idrespondet,nombreResponden,sexoresponden,
                                 telefonoresponden, id_relacion)
         values ('$identificacion', '$nombre','$generoaso','$tefonoaso','$relacionaso');");
?>