<?php
$identificacion= $_SESSION["idrespondedor"];
$nombre=$_SESSION["nombreresopondedor"];
$generoaso=$_SESSION["sexorespondedor"];
$tefonoaso=$_SESSION["relacion"];
$relacionaso=$_SESSION["telefonorespondedor"];

$consulta = "INSERT INTO respondedor (idrespondet, nombreResponden, sexoresponden, telefonoresponden, id_relacion) VALUES ('$identificacion', '$nombre', '$generoaso', '$tefonoaso', '$relacionaso')";
$resultado = $conexion->query($consulta);

if (!$conexion) {
  die("La conexión mysqli se ha cerrado antes de lo esperado.");
}
?>