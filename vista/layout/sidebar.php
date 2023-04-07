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
                        <span class="lbl">E</span>
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
        <?php       if ($_SESSION["idrol"] == 1) { ?>
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
                        </li> <li>
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