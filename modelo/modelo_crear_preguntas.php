<?php 
if(!empty($_POST['edad'])){
$edad=$_POST['edad'];
$subdominio = "Expresiva";
$contador = 0;
// Ejecutar la consulta y obtener los resultados
$result = $conexion->query("SELECT `id`, `numero_pregunta`, `subdominio`, `dominio`, `edad`, `operador`, `enunciado` FROM `preguntas` WHERE `subdominio` = 'Expresiva' and `edad` = $edad;");

// Mostrar las preguntas en una tabla HTML
if ($result->num_rows > 0) {
  
  while($row = $result->fetch_assoc()) {
    echo "<lu>";
    echo "<p>" . $row["enunciado"] . "</p>";
    echo "<li><input type='radio' name='pregunta".$contador."' value='2'> 2</li>";
    echo "<li><input type='radio' name='pregunta".$contador."' value='1'> 1</li>";
    echo "<li><input type='radio' name='pregunta".$contador."' value='0'> 0</li>";
    echo "<li><input type='radio' name='pregunta".$contador."' value='DK'> DK</li>";
    echo "</lu>";
    $contador++;
  }

} else {
  echo "No se encontraron preguntas";
}

// Cerrar la conexión
$conexion->close();
}
?>

