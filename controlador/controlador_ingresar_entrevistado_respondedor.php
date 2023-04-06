<?php 
    if (!empty($_POST["btnentrevistado"])) {
        if (!empty($_POST["nombreaso"]) and !empty($_POST["Telefonoaso"]) and !empty($_POST["identificacionaso"])
        and !empty($_POST["generoaso"]) and !empty($_POST["relacionaso"])) {
            $nombre = $_POST["nombreaso"];
            $identificacion = $_POST["identificacionaso"];
            $tefonoaso =$_POST["Telefonoaso"];
            $generoaso= $_POST["generoaso"];
            $relacionaso = $_POST["relacionaso"];

            
            $resultado= $conexion->query("insert into respondedor (idrespondet,nombreResponden,sexoresponden, telefonoresponden, id_relacion)
            values ('$identificacion', '$nombre','$generoaso','$tefonoaso','$relacionaso')");
            
            if ($resultado==true) {?>
                 <script>
                    $(function notificacion(){
                            new PNotify({
                                title: "CORRECTO",
                                type: "success",
                                text: "Entrevistado registrado correctamente",
                                styling: "bootstrap3"
                            })

                        })
             </script>
           <?php 
        } else {?>
            <script>
                    $(function notificacion(){
                            new PNotify({
                                title: "INCORRECTO",
                                type: "error",
                                text: "No se registro ",
                                styling: "bootstrap3"
                            })

                        })
             </script>
           <?php }
        } else {?>
             <script>
              $(function notificacion(){
                    new PNotify({
                        title: "ERROR",
                        type: "error",
                        text: "Campos vacios",
                        styling: "bootstrap3"
                    })

                })
             </script>
       <?php } ?>
    
   <?php }?>
