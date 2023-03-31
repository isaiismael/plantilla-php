<?php 
    if (!empty($_GET["id"])) {
        $id = $_GET["id"];
        $sql=$conexion->query("delete from usuarios where id=$id ");
        if ($sql == true) {?>
            <script>
                $(function notificacion(){
                    new PNotify({
                        title: "Correcto",
                        type: "success",
                        text: "Usuario eliminado correctamente",
                        styling: "bootstrap3"
                    })

                })
            </script>
        <?php } ?>
   <?php } ?>
