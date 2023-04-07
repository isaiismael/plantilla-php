<?php 
    if (!empty($_POST["btnregistar"])) {
        if (!empty($_POST["txtnombre"]) and !empty($_POST["txtapellido"]) 
        and !empty($_POST["txtusuario"]) and !empty($_POST["txtpassword"])
        and !empty($_POST["sidrol"]) and !empty($_POST["sidsexo"])and !empty($_POST["scargo"])
        and !empty($_POST["txtcedula"])) {
            $nombre = $_POST["txtnombre"];
            $apellido =$_POST["txtapellido"];
            $usuario = $_POST["txtusuario"];
            $password = $_POST["txtpassword"];
            $idrol = $_POST["sidrol"];
            $idsexo =$_POST["sidsexo"];
            $cargo =$_POST["scargo"];
            $cedula = $_POST["txtcedula"];

            $sql = $conexion->query(" select count(*) as 'total' from usuarios where usuario='$usuario' ");
            if ($sql->fetch_object()->total > 0) {?>
                <script>
                    $(function notificacion(){
                            new PNotify({
                                title: "ERROR",
                                type: "error",
                                text: "Usuario ya existe",
                                styling: "bootstrap3"
                            })

                        })
             </script>
           <?php } else {
            $resultado= $conexion->query("insert into usuarios (idrol,Nombre,apellidos, usuario, contraseña, idsexo, idempresa, idcargo,cedula)
            values ('$idrol', '$nombre','$apellido','$usuario', '$password', '$idsexo', 0, '$cargo','$cedula')");
            }
            if ($resultado==true) {?>
                 <script>
                    $(function notificacion(){
                            new PNotify({
                                title: "CORRECTO",
                                type: "success",
                                text: "Usuario registrado correctamente",
                                styling: "bootstrap3"
                            })

                        })
             </script>
           <?php } else {?>
            <script>
                    $(function notificacion(){
                            new PNotify({
                                title: "INCORRECTO",
                                type: "error",
                                text: "Usuario ya existe",
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
        <script>
            setTimeout(() => {
                window.history.replaceState(null,null,window.location.pathname)
            }, 0);
        </script>
   <?php }?>
