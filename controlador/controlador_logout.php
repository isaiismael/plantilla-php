<?php

session_start();
session_destroy();
header('location:/vineland/vista/login/login.php');

?>