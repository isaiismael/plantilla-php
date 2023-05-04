<?php
session_start();
if (empty($_SESSION['nombre']) and empty($_SESSION['apellido'])) {
  header('location:login/login.php');
}
?>
<link rel="stylesheet" type="text/css" href="../vista/inicio/css/formulario-entrevistado.css"> 
<script src="../vista/inicio/js/Entrevistado.js"></script>


<!-- primero se carga el topbar -->
<?php require('./layout/topbar.php'); ?>
<!-- luego se carga el sidebar -->
<?php require('./layout/sidebar.php'); ?>
<!-- inicio del contenido principal -->
<?php include("../modelo/conexion.php"); ?>

 <!-- <script src="../vista/inicio/js/Entrevistado.js"></script> -->


 <body>

  <div class="page-content">
    <div class="formulario">
        <header>Registro</header>

        <form method="POST" action="receptiva.php">
            <div class="form first">
                <div class="details personal">
                    <span class="title">Datos Personales</span>

                    <div class="fields">
                        <div class="input-field">
                            <label>Nombre Completo</label>
                            <input id="nombre" type="text" placeholder="Ingresa tu nombre" required>
                        </div>

                        <div class="input-field">
                            <label>Fecha de nacimiento</label>
                            <input id="fecha_n"type="date" placeholder="Ingresa la Fecha de Nacimiento" required>
                        </div>

                        <div class="input-field">
                            <label>Email</label>
                            <input id="email" type="text" placeholder="Entra el correo electronico" required>
                        </div>

                        <div class="input-field">
                            <label>Numero Telefonico</label>
                            <input type="number" placeholder="Entra el numero telefonico" required>
                        </div>

                        <div class="input-field">
                            <label>Genero</label>
                            <select id="sexo" required>
                                <option disabled selected>Selecciona el Genero</option>
                                <option>Masculino</option>
                                <option>Femenino</option>
                                <option>Otros</option>
                            </select>
                        </div>

                        <div class="input-field">
                            <label>Grado</label>
                            <input id="grado" type="text" placeholder="Grado Actual" required>
                        </div>

                        <div class="input-field">
                            <label>Grado Max</label>
                            <input id="gradomax" type="text" placeholder="Ingresa el Grado Maximo cursado" required>
                        </div>

                        <div class="input-field">
                            <label>Colegio/Otros</label>
                            <input id="colegio" type="text" placeholder="Ingrese el colegio u otro" required>
                        </div>

                        <div class="input-field">
                            <label>Diagnosis</label>
                            <input id="diagnosis" type="text" placeholder="Ingrese el diagnosis del entrevistado" required>
                        </div>
                        <div class="input-field">
                            <label>Edad Cronologica</label>
                            <input id="edad" type="text" placeholder="AA/MM/DD" required>
                        </div>

                        <div class="input-field">
                            <label>Razon Entrevista</label>
                            <input id="razon" type="text" placeholder="Ingrese la razon de la entrevista" required>
                        </div>
                        
                    </div>
                </div>

                <div class="details ID">
                    <span class="title">Datos Respondedor</span>

                    <div class="fields">
                        <div class="input-field">
                            <label>ID respondedor</label>
                            <input id="idrespondedor"type="text" placeholder="C.C , C.E, T.I" required>
                        </div>

                        <div class="input-field">
                            <label>Nombre Completo</label>
                            <input id="nombrerespondedor"type="number" placeholder="Ingresar nombre completo" required>
                        </div>

                        <div class="input-field">
                        <label>Genero</label>
                            <select required id="sexorespondedor">
                                <option disabled selected>Selecciona el Genero</option>
                                <option>Masculino</option>
                                <option>Femenino</option>
                                <option>Otros</option>
                            </select>
                        </div>
                        <div class="input-field">
                            <label>Telefono</label>
                            <input id="telefonorespondedor"type="text" placeholder="Ingresa el telefono del respondedor" required>
                        </div>

                        <div class="input-field">
                        <label>Tipo de Relacion</label>
                            <select id="relacion"required>
                                <option disabled selected>Selecciona el tipo de relacion</option>
                                <option>Madre</option>
                                <option>Padre</option>
                                <option>Hijo</option>
                                <option>Hermano</option>
                                <option>Hermana</option>
                                <option>Tio</option>
                                <option>Tia</option>
                                <option>Primo</option>
                                <option>Prima</option>
                                <option>Madrastra</option>
                                <option>Padrastro</option>
                                <option>Familiar</option>
                                <option>Otros</option>
                            </select>
                        </div>
                </div> 
            </div>
                    <div class="buttons">
                        
                        
                        <button class="sumbit" id="diossoyo">
                            <span class="btnText">Submit</span>
                            <i class="uil uil-navigator"></i>
                        </button>
                    </div>
                </div> 
            </div>
        </form>
    </div>

    </div>
    </body>

<!-- por ultimo se carga el footer -->
<?php require('./layout/footer.php'); ?>