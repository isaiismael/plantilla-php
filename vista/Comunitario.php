
<?php
session_start();
if (empty($_SESSION['nombre']) and empty($_SESSION['apellido'])) {
  header('location:login/login.php');
  
}
if($_GET["total"] != null){
    
    $total = $_GET["total"];
    
    $_SESSION['domestico'] = $total;
}
?>

<!-- primero se carga el topbar -->
<?php require('./layout/topbar.php'); ?>
<!-- luego se carga el sidebar -->
<?php require('./layout/sidebar.php'); ?>
<script src="../vista/inicio/js/preguntas_comunitaria.js"></script>
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
                <li class="step-wizard-item">
                    <span class="progress-count">4</span>
                    <span class="progress-label">Personal</span>
                </li>
                <li class="step-wizard-item">
                    <span class="progress-count">5</span>
                    <span class="progress-label">Domestico</span>
                </li>
                <li class="step-wizard-item current-item">
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
            <h3 id="subdominio">Comunitario</h3>
            <div class="imagenes-contenedor">
                <div class="imagen">
                    <img src="../vista/inicio/img/Telephone skills.png">
                    <span class="imagen-texto">Telephone skills</span>
                </div>
                <div class="imagen">
                    <img src="../vista/inicio/img/Rules,Rights and safety.png">
                    <span class="imagen-texto">Rules,Rights and safety</span>
                </div>
                <div class="imagen">
                    <img src="../vista/inicio/img/Times and Dates.png">
                    <span class="imagen-texto">Times and Dates</span>
                </div>
                <div class="imagen">
                    <img src="../vista/inicio/img/Job Skills.png">
                    <span class="imagen-texto">Job Skills</span>
                </div>
                <div class="imagen">
                    <img src="../vista/inicio/img/Computer Skills.png">
                    <span class="imagen-texto">Computer Skills</span>
                </div>
                <div class="imagen">
                    <img src="../vista/inicio/img/Money Skills.png">
                    <span class="imagen-texto">Money Skills</span>
                </div>
                <div class="imagen">
                    <img src="../vista/inicio/img/Restaurant Skills.png">
                    <span class="imagen-texto">Restaurant Skills</span>
                </div>
                <div class="imagen">
                    <img src="../vista/inicio/img/Television and Radio.png">
                    <span class="imagen-texto">Television and Radio</span>
                </div>
                <div class="imagen">
                    <img src="../vista/inicio/img/Going Places Independently.png">
                    <span class="imagen-texto">Going Places Independently</span>
                </div>
            </div>
            <form id="preguntas-contenedor">
                <?php
                include("../modelo/conexion.php");
                require("../modelo/modelo_crear_preguntas_comunitario.php");

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