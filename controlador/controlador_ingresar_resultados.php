<?php

    if(!empty($_SESSION['receptiva'])){
        $identrevistado = $_SESSION['id_entrevistado'];
       $idusuario = $_SESSION['id_usuario'];
       $receptiva = $_SESSION['receptiva'];
       $expresiva = $_SESSION['expresiva'];
       $comunitario= $_SESSION['comunitario'];
       $juego= $_SESSION['juego'];
       $personal = $_SESSION['personal'];
       $domestico= $_SESSION['domestico'];
       $escritura = $_SESSION['escritura'];
       $afrontamiento = $_SESSION['afrontamiento'];
       $interpersonales = $_SESSION['interpersonales'];
       $gruesa = $_SESSION['gruesa'];
       $fina = $_SESSION['fina'];

        $sql = $conexion->query("INSERT INTO resultados (identrevistado, idusuario, Receptiva, Expresiva,
        Escritura, Personal, Domestico, Comunitario, Relaciones_Interpersonales, Juego_y_tiempo_libre,
        Habilidades_de_afrontamiento, Motricidad_Gruesa, Motricidad_Fina)
        VALUES
        ($identrevistado, $idusuario,$receptiva,$expresiva, $escritura, $personal, $domestico, $comunitario,
        $interpersonales, $juego, $afrontamiento, $gruesa, $fina);");
    }
?>