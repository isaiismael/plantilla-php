<?php
session_start();
if (empty($_SESSION['nombre']) and empty($_SESSION['apellido'])) {
  header('location:login/login.php');
  
}
if($_GET["total"] != null){
    
    $total = $_GET["total"];
    
    $_SESSION['expresiva'] = $total;
}
?>

<!-- primero se carga el topbar -->
<?php require('./layout/topbar.php'); ?>
<!-- luego se carga el sidebar -->
<?php require('./layout/sidebar.php'); ?>
<script src="../vista/inicio/js/preguntas_escritura.js"></script>
<!-- inicio del contenido principal -->

<body>
   
    <div class="page-content">
        <section id="preguntas">
            <h2>Subdominio</h2>
            <h3 id="subdominio">Escritura</h3>
            <div class="imagenes-contenedor">
                <div class="imagen">
                    <img src="../vista/inicio/img/Beginning to Read.png">
                    <span class="imagen-texto">Beginning to Read</span>
                </div>
                <div class="imagen">
                    <img src="../vista/inicio/img/Reading Skills.png">
                    <span class="imagen-texto">Reading Skills</span>
                </div>
                <div class="imagen">
                    <img src="../vista/inicio/img/Writing Skills.png">
                    <span class="imagen-texto">Writing Skills</span>
                </div>
            </div>
            <form id="preguntas-contenedor">
                <?php
                include("../modelo/conexion.php");
                require("../modelo/modelo_crear_preguntas_escritura.php");

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