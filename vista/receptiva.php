<?php
session_start();
if (empty($_SESSION['nombre']) and empty($_SESSION['apellido'])) {
    header('location:login/login.php');
}
$identrevistado = $_POST["identrevistado"];
$nombrecompleto = $_POST["nombre"];
$fecha_n = $_POST["fecha_n"];
$email = $_POST["email"];
$telef = $_POST["telefono"];
$genero = $_POST["sexo"];
$grado = $_POST["grado"];
$gradomax = $_POST["gradomax"];
$colegio = $_POST["colegio"];
$diagnosis = $_POST["diagnosis"];
$edadcronologica = $_POST["edad"];
$razon = $_POST["razon"];

$idresponder = $_POST["idrespondedor"];
$nombrecompletorespon = $_POST["nombrerespondedor"];
$generorespon = $_POST["sexorespondedor"];
$tiporelacion = $_POST["relacion"];
$telefonoresp = $_POST["telefonorespondedor"];

$_SESSION["identrevistado"] = $identrevistado;
$_SESSION["nombre"] = $nombrecompleto;
$_SESSION["fecha_n"] = $fecha_n;
$_SESSION["email"] = $email;
$_SESSION["telefono"] = $telef;
$_SESSION["sexo"] = $genero;
$_SESSION["grado"] = $grado;
$_SESSION["gradomax"] = $gradomax;
$_SESSION["colegio"] = $colegio;
$_SESSION["diagnosis"] = $diagnosis;
$_SESSION["edad"] = $edadcronologica;
$_SESSION["razon"] = $razon;

$_SESSION["idrespondedor"] = $idresponder;
$_SESSION["nombreresopondedor"] = $nombrecompletorespon;
$_SESSION["sexorespondedor"] = $generorespon;
$_SESSION["relacion"] = $tiporelacion;
$_SESSION["telefonorespondedor"] = $telefonoresp;


?>

<!-- primero se carga el topbar -->
<?php require('./layout/topbar.php'); ?>
<!-- luego se carga el sidebar -->
<?php require('./layout/sidebar.php'); ?>
<script src="../vista/inicio/js/Preguntas.js"></script>
<!-- inicio del contenido principal -->

<body>

    <div class="page-content">
        <section id="preguntas">
            <h2>Subdominio</h2>
            <h3 id="subdominio">Receptiva</h3>
            <div class="imagenes-contenedor">
                <div class="imagen">
                    <img src="../vista/inicio/img/Understanding.png">
                    <span class="imagen-texto">Understanding</span>
                </div>
                <div class="imagen">
                    <img src="../vista/inicio/img/Listening and Attending.png">
                    <span class="imagen-texto">Listening and Attending</span>
                </div>
                <div class="imagen">
                    <img src="../vista/inicio/img/Following Instructions.png">
                    <span class="imagen-texto">Following Instructions</span>
                </div>
            </div>
            <form id="preguntas-contenedor">
                <?php
                include("../modelo/conexion.php");
                include("../modelo/modelo_crear_preguntas.php");
                ?>

                Regla basal<input type="text" name="" id="mregla">
                Numero de DK<input type="text" name="" id="mdk">
                Suma de 2+1<input type="text" name="" id="m1">
                Numero de 0<input type="text" name="" id="m0">
                Puntaje en Subdominio Receptiva<input type="text" name="" id="total">
                <button id="btnevaluar" value="presionado" type="submit" class="btn btn-primary btn-rounded">Siguiente</button>
                <button id="btncargar" class="btn btn-primary btn-rounded" onclick="ReglaBasal()">Evaluar</button>

            </form>

        </section>
        <?php
        //include("../modelo/conexion.php");
        //include("../controlador/controlador_ingresar_entrevistado_respondedor.php");
        ?>

    </div>

    <!-- fin del contenido principal -->

</body>



<!-- por ultimo se carga el footer -->
<?php require('./layout/footer.php'); ?>