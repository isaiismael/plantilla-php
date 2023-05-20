<?php
session_start();
if (empty($_SESSION['nombre']) and empty($_SESSION['apellido'])) {
    header('location:login/login.php');
}
if ($_GET["total"] != null) {

    $total = $_GET["total"];

    $_SESSION['receptiva'] = $total;
}


?>
<script src="../vista/inicio/js/preguntas_expresiva.js"></script>
<!-- primero se carga el topbar -->
<?php require('./layout/topbar.php'); ?>
<!-- luego se carga el sidebar -->
<?php require('./layout/sidebar.php'); ?>

<!-- inicio del contenido principal -->

<body>

    <div class="page-content">
        <div class="container">
            <div class="steps">
                <span class="circle active" id="1">1</span>
                <p>Receptiva</p>
                <span class="circle" id="2">2</span>
                <p>Expresiva</p>
                <span class="circle" id="3">3</span>
                <p>Escritura</p>
                <span class="circle" id="4">4</span>
                <p>Comunitaria</p>
                <span class="circle" id="5">5</span>
                <div class="progress-bar">
                    <span class="indicator"></span>
                </div>
            </div>
        </div>
        
        <section id="preguntas">
            <h2>Subdominio</h2>
            <h3 id="subdominio">Expresiva</h3>
            <!-- Escritura.php  -->
            <div class="imagenes-contenedor">
                <div class="imagen">
                    <img src="../vista/inicio/img/Pre-Speech Expression.png">
                    <span class="imagen-texto">Pre-Speech</span>
                </div>
                <div class="imagen">
                    <img src="../vista/inicio/img/Beginning to talk.png">
                    <span class="imagen-texto">Beginin to talk</span>
                </div>
                <div class="imagen">
                    <img src="../vista/inicio/img/Interactive Speech.png">
                    <span class="imagen-texto">Interactive Speech</span>
                </div>
                <div class="imagen">
                    <img src="../vista/inicio/img/Speech Skills.png">
                    <span class="imagen-texto">Speech Skills</span>
                </div>
                <div class="imagen">
                    <img src="../vista/inicio/img/Expressing Complex Ideas.png">
                    <span class="imagen-texto">Expressing Complex Ideas</span>
                </div>
            </div>
            <form id="preguntas-contenedor">
                <?php
                include("../modelo/conexion.php");
                include("../modelo/modelo_crear_preguntas_expresiva.php");
                ?>

                <div id="resultados">
                    <label>Regla basal</label>
                    <input type="text" name="" id="mregla">
                    Numero de DK<input type="text" name="" id="mdk">
                    Suma de 2+1<input type="text" name="" id="m1">
                    Numero de 0<input type="text" name="" id="m0">
                    Puntaje en Subdominio Receptiva<input type="text" name="" id="expresiva">
                </div>
                <button id="btnexpresiva" value="presionado" type="submit" class="btn btn-primary btn-rounded">Siguiente</button>
                <button id="btncargar" class="btn btn-primary btn-rounded" onclick="ReglaBasal()">Evaluar</button>
            </form>
        </section>

    </div>

    <!-- fin del contenido principal -->

</body>



<!-- por ultimo se carga el footer -->
<?php require('./layout/footer.php'); ?>