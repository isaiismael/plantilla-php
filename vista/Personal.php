<?php
session_start();
if (empty($_SESSION['nombre']) and empty($_SESSION['apellido'])) {
  header('location:login/login.php');
  
}
if($_GET["total"] != null){
    
    $total = $_GET["total"];
    
    $_SESSION['escritura'] = $total;
}

?>

<!-- primero se carga el topbar -->
<?php require('./layout/topbar.php'); ?>
<!-- luego se carga el sidebar -->
<?php require('./layout/sidebar.php'); ?>
<script src="../vista/inicio/js/preguntas_personal.js"></script>
<!-- inicio del contenido principal -->

<body>
   
    <div class="page-content">
    <section class="step-wizard">
            <ul class="step-wizard-list">
                <li class="step-wizard-item ">
                    <span class="progress-count">1</span>
                    <span class="progress-label">Receptiva</span>
                </li>
                <li class="step-wizard-item">
                    <span class="progress-count">2</span>
                    <span class="progress-label">Expresiva</span>
                </li>
                <li class="step-wizard-item">
                    <span class="progress-count">3</span>
                    <span class="progress-label">Escritura</span>
                </li>
                <li class="step-wizard-item current-item">
                    <span class="progress-count">4</span>
                    <span class="progress-label">Personal</span>
                </li>
                <li class="step-wizard-item">
                    <span class="progress-count">5</span>
                    <span class="progress-label">Domestico</span>
                </li>
                <li class="step-wizard-item">
                    <span class="progress-count">6</span>
                    <span class="progress-label">Comunitario</span>
                </li>
                <li class="step-wizard-item">
                    <span class="progress-count">7</span>
                    <span class="progress-label">Relaciones Interpersonales</span>
                </li>
                <li class="step-wizard-item">
                    <span class="progress-count">8</span>
                    <span class="progress-label">Juego y Tiempo Libre</span>
                </li>
                <li class="step-wizard-item">
                    <span class="progress-count">9</span>
                    <span class="progress-label">Habilidades de Afrontamiento </span>
                </li>
                <li class="step-wizard-item">
                    <span class="progress-count">10</span>
                    <span class="progress-label">Gruesa</span>
                </li>
                <li class="step-wizard-item">
                    <span class="progress-count">11</span>
                    <span class="progress-label">Fina</span>
                </li>
            </ul>
        </section>
        <section id="preguntas">
            <h2>Subdominio</h2>
            <h3 id="subdominio">Personal</h3>
            <div class="imagenes-contenedor">
                <div class="imagen">
                    <img src="../vista/inicio/img/Eating and Drinking.png">
                    <span class="imagen-texto">Eating and Drinking</span>
                </div>
                <div class="imagen">
                    <img src="../vista/inicio/img/Toileting.png">
                    <span class="imagen-texto">Toileting</span>
                </div>
                <div class="imagen">
                    <img src="../vista/inicio/img/Dressing.png">
                    <span class="imagen-texto">Dressing</span>
                </div>
                <div class="imagen">
                    <img src="../vista/inicio/img/Bathing.png">
                    <span class="imagen-texto">Bathing</span>
                </div>
                <div class="imagen">
                    <img src="../vista/inicio/img/Grooming.png">
                    <span class="imagen-texto">Grooming</span>
                </div>
                <div class="imagen">
                    <img src="../vista/inicio/img/Health Care.png">
                    <span class="imagen-texto">Health Care</span>
                </div>
            </div>
            <form id="preguntas-contenedor">
                <?php
                include("../modelo/conexion.php");
                require("../modelo/modelo_crear_preguntas_personal.php");

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