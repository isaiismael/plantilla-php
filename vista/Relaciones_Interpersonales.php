<?php
session_start();
if (empty($_SESSION['nombre']) and empty($_SESSION['apellido'])) {
  header('location:login/login.php');
  
}
if($_GET["total"] != null){
    
    $total = $_GET["total"];
    
    $_SESSION['comunitario'] = $total;
}

?>

<!-- primero se carga el topbar -->
<?php require('./layout/topbar.php'); ?>
<!-- luego se carga el sidebar -->
<?php require('./layout/sidebar.php'); ?>
<script src="../vista/inicio/js/preguntas_relaciones_interpersonales.js"></script>
<!-- inicio del contenido principal -->

<body>
   
    <div class="page-content">
        <section id="preguntas">
            <h2>Subdominio</h2>
            <h3 id="subdominio">Relaciones Interpersonales</h3>
            <div class="imagenes-contenedor">
                <div class="imagen">
                    <img src="../vista/inicio/img/Responding to Others.png">
                    <span class="imagen-texto">Responding to Others</span>
                </div>
                <div class="imagen">
                    <img src="../vista/inicio/img/Expressing and Recognizin Emotions.png">
                    <span class="imagen-texto">Expressing and Recognizin Emotions</span>
                </div>
                <div class="imagen">
                    <img src="../vista/inicio/img/Imitating.png">
                    <span class="imagen-texto">Imitating</span>
                </div>
                <div class="imagen">
                    <img src="../vista/inicio/img/Social Communication.png">
                    <span class="imagen-texto">Social Communication</span>
                </div>
                <div class="imagen">
                    <img src="../vista/inicio/img/Thoughtfulness.png">
                    <span class="imagen-texto">Thoughtfulness</span>
                </div>
                <div class="imagen">
                    <img src="../vista/inicio/img/Friendship.png">
                    <span class="imagen-texto">Friendship</span>
                </div>
                <div class="imagen">
                    <img src="../vista/inicio/img/Dating.png">
                    <span class="imagen-texto">Dating</span>
                </div>
            </div>
            <form id="preguntas-contenedor">
                <?php
                include("../modelo/conexion.php");
                include("../modelo/modelo_crear_preguntas_Relaciones_interpersonales.php");

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