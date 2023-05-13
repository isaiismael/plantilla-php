<?php

$idrespon = $_SESSION["idrespondedor"];
$identificacion= $_SESSION["identrevistado"];
$nombrecompleto = $_SESSION["nombre"];
$fecha_n =$_SESSION["fecha_n"];
$email = $_SESSION["email"];
$telef =$_SESSION["telefono"];
$genero =$_SESSION["sexo"];
$grado =$_SESSION["grado"];
$gradomax =$_SESSION["gradomax"];
$colegio =$_SESSION["colegio"];
$diagnosis =$_SESSION["diagnosis"];
$edadcronologica =$_SESSION["edad"];
$razon =$_SESSION["razon"];


$sql = $conexion->query("INSERT INTO entrevistados(cedula, idrespon, nombre, idgenero, grado, gradomasalto,
                        colegiouotros, diagnosis, fechanacimiento, edad_cronologica, razon_entrevista)
                        values('$identificacion','$idrespon','$nombrecompleto','$genero','$grado','$gradomax',
                        '$colegio','$diagnosis','$fecha_n','$edadcronologica','$razon');")

?>