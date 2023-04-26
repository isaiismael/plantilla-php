<?php 
if(!empty($_POST['btnevaluar'])){
$total = $_POST['total'];

$_SESSION['receptiva'] = $total;
}

?>