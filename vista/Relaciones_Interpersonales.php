<?php
session_start();
if (empty($_SESSION['nombre']) and empty($_SESSION['apellido'])) {
  header('location:login/login.php');
}
?>

<!-- primero se carga el topbar -->
<?php require('./layout/topbar.php'); ?>
<!-- luego se carga el sidebar -->
<?php require('./layout/sidebar.php'); ?>
<script src="../vista/inicio/js/preguntas_expresiva.js"></script>
<!-- inicio del contenido principal -->

<body>
   
    <div class="page-content">
        <section id="preguntas">
            <h3>Subdominio</h3>
            <h2 id="subdominio">Relaciones Interpersonales</h2>
            <form id="preguntas-contenedor">
                <?php
                include("../modelo/conexion.php");
                require("../modelo/modelo_crear_preguntas_Relaciones_interpersonales.php");

                ?>
				<div id="resultados">
                <label>Regla basal</label>
				<input type="text" name="" id="mregla">
                Numero de DK<input type="text" name="" id="mdk">
                Suma de 2+1<input type="text" name="" id="m1">
                Numero de 0<input type="text" name="" id="m0">
                Puntaje en Subdominio Receptiva<input type="text" name="" id="total">
				</div>
                <button name="btnevaluar" value="" type="submit" class="btn btn-primary btn-rounded">Siguiente</button>
            </form>
        </section>


    </div>

    <!-- fin del contenido principal -->

</body>



<!-- por ultimo se carga el footer -->
<?php require('./layout/footer.php'); ?>