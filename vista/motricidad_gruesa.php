<?php
session_start();
if (empty($_SESSION['nombre']) and empty($_SESSION['apellido'])) {
  header('location:login/login.php');
  
}
if($_GET["total"] != null){
    
    $total = $_GET["total"];
    
    $_SESSION['afrontamiento'] = $total;
}
?>

<!-- primero se carga el topbar -->
<?php require('./layout/topbar.php'); ?>
<!-- luego se carga el sidebar -->
<?php require('./layout/sidebar.php'); ?>
<script src="../vista/inicio/js/preguntas_motricidadgruesa.js"></script>
<!-- inicio del contenido principal -->

<body>
   
    <div class="page-content">
        <section id="preguntas">
            <h2>Subdominio</h2>
            <h3 id="subdominio">Motricidad Gruesa</h3>
            <div class="imagenes-contenedor">
                <div class="imagen">
                    <img src="../vista/inicio/img/Sitting.png">
                    <span class="imagen-texto">Sitting</span>
                </div>
                <div class="imagen">
                    <img src="../vista/inicio/img/Walking and Running.png">
                    <span class="imagen-texto">Walking and Running</span>
                </div>
                <div class="imagen">
                    <img src="../vista/inicio/img/Play Activity.png">
                    <span class="imagen-texto">Play Activity</span>
                </div>
                <div class="imagen">
                    <img src="../vista/inicio/img/Creeping and Crawling.png">
                    <span class="imagen-texto">Creeping and Crawling</span>
                </div>
                <div class="imagen">
                    <img src="../vista/inicio/img/Standing.png">
                    <span class="imagen-texto">Standing</span>
                </div>
            </div>
            <form id="preguntas-contenedor">
                <?php
                include("../modelo/conexion.php");
                require("../modelo/modelo_crear_preguntas_motricidadgruesa.php");

                ?>
				<div id="resultados">
                <label>Regla basal</label>
				<input type="text" name="" id="mregla">
                Numero de DK<input type="text" name="" id="mdk">
                Suma de 2+1<input type="text" name="" id="m1">
                Numero de 0<input type="text" name="" id="m0">
                Puntaje en Subdominio Receptiva<input type="text" name="" id="total">
				</div>
                <button id="btnevaluar" value="presionado" type="submit" class="btn btn-primary btn-rounded">Siguiente</button>
                <button id="btncargar" class="btn btn-primary btn-rounded" onclick="ReglaBasal()">Evaluar</button>
            </form>
        </section>


    </div>

    <!-- fin del contenido principal -->

</body>



<!-- por ultimo se carga el footer -->
<?php require('./layout/footer.php'); ?>