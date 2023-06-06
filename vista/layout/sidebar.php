<nav class="side-menu">

    <ul class="side-menu-list p-0">
        <li class="red">
            <a href="inicio.php" class="">
                <img src="../public/img-inicio/house.png" class="img-inicio" alt="">
                <!-- <i class="fas fa-house-user"></i> -->
                <span class="lbl">INICIO</span>
            </a>
        </li>

        <li class="grey with-sub">
            <span>
                <img src="../public/img-inicio/programar.png" class="img-inicio" alt="">
                <!-- <i class="fas fa-sort-amount-up-alt"></i> -->
                <span class="lbl">Evaluaciones</span>
            </span>
            <ul>
                <li>
                    <a href="registroentrevistado.php" class="">
                        <i class="fas fa-plus-square icono-submenu"></i>
                        <span class="lbl">Evaluar</span>
                    </a>
                </li>
                <li>
                    <a href="" class="">
                        <i class="fas fa-th-list icono-submenu"></i>
                        <span class="lbl">Lista de Evaluaciones</span>
                    </a>
                </li>
            </ul>
        </li>
        <?php if (isset($_SESSION['receptiva'])) {?>
        <li class="grey with-sub">
            <span>
            <img src="../public/img-inicio/info.png" class="img-inicio" alt="">
            <!-- <i class="fas fa-exclamation"></i> -->
            <span class="lbl">Estado Evaluacion</span>
            </span>
            <ul>
                <li>
                    <a href="receptiva.php" class="">
                        <i class="fas fa-th-list icono-submenu"></i>
                        <span class="lbl">Receptiva</span>
                    </a>
                </li>
                <?php if (isset($_SESSION['expresiva'])) {?>
                <li>
                    <a href="expresiva.php" class="">
                        <i class="fas fa-th-list icono-submenu"></i>
                        <span class="lbl">Expresiva</span>
                    </a>
                </li>
                <?php }?>
                <?php if (isset($_SESSION['escritura'])) {?>
                <li>
                    <a href="Escritura.php" class="">
                        <i class="fas fa-th-list icono-submenu"></i>
                        <span class="lbl">Escritura</span>
                    </a>
                </li>
                <?php }?>
                <?php if (isset($_SESSION['personal'])) {?>
                <li>
                    <a href="Personal.php" class="">
                        <i class="fas fa-th-list icono-submenu"></i>
                        <span class="lbl">Personal</span>
                    </a>
                </li>
                <?php }?>
                <?php if (isset($_SESSION['domestico'])) {?>
                <li>
                    <a href="Domestico.php" class="">
                        <i class="fas fa-th-list icono-submenu"></i>
                        <span class="lbl">Domestico</span>
                    </a>
                </li>
                <?php }?>
                <?php if (isset($_SESSION['comunitario'])) {?>
                <li>
                    <a href="Comunitario.php" class="">
                        <i class="fas fa-th-list icono-submenu"></i>
                        <span class="lbl">Comunitario</span>
                    </a>
                </li>
                <?php }?>
                <?php if (isset($_SESSION['interpersonales'])) {?>
                <li>
                    <a href="Relaciones_Interpersonales.php" class="">
                        <i class="fas fa-th-list icono-submenu"></i>
                        <span class="lbl">Relaciones Interpersonales</span>
                    </a>
                </li>
                <?php }?>
                <?php if (isset($_SESSION['juego'])) {?>
                <li>
                    <a href="Juego_y_tiempo_libre.php" class="">
                        <i class="fas fa-th-list icono-submenu"></i>
                        <span class="lbl">Juegos y Tiempo libre</span>
                    </a>
                </li>
                <?php }?>
                <?php if (isset($_SESSION['afrontamiento'])) {?>
                <li>
                    <a href="Habilidades_afrontamiento.php" class="">
                        <i class="fas fa-th-list icono-submenu"></i>
                        <span class="lbl">Habilidades de Afrontamiento</span>
                    </a>
                </li>
                <?php }?>
                <?php if (isset($_SESSION['gruesa'])) {?>
                <li>
                    <a href="motricidad_gruesa.php" class="">
                        <i class="fas fa-th-list icono-submenu"></i>
                        <span class="lbl">Motricidad Gruesa</span>
                    </a>
                </li>
                <?php }?>
                <?php if (isset($_SESSION['fina'])) {?>
                <li>
                    <a href="motricidad_fina.php" class="">
                        <i class="fas fa-th-list icono-submenu"></i>
                        <span class="lbl">Motricidad Fina</span>
                    </a>
                </li>
                <?php }?>
            </ul>
        </li>
        <?php } ?>
        <?php if ($_SESSION["idrol"] == 1) { ?>
            <li class="grey with-sub">

                <span>

                    <img src="../public/img-inicio/pngwing.com.png" class="img-inicio" style="color:aqua">
                    <!-- <i class="fas fa-sort-amount-up-alt"></i> -->
                    <span class="lbl">Parametrizar</span>

                </span>

                <ul>
                    <li>
                        <a href="listausuarios.php" class="">
                            <i class="fas fa-th-list icono-submenu"></i>
                            <span class="lbl">Usuarios</span>
                        </a>
                    </li>
                    <li>
                        <a href="listausuarios.php" class="">
                            <i class="fas fa-th-list icono-submenu"></i>
                            <span class="lbl">Empresas</span>
                        </a>
                    </li>
                </ul>
            </li>
        <?php } ?>
        <li class="red">
            <a href="acerca.php" class="">
                <img src="../public/img-inicio/info.png" class="img-inicio" alt="">
                <!-- <i class="fas fa-exclamation"></i> -->
                <span class="lbl">ACERCA DE</span>
            </a>
        </li>




    </ul>
</nav>