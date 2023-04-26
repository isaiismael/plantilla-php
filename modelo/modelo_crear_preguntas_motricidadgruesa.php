<?php 
$subdominio = "Motricidad Gruesa";
$contador = 0;
// Ejecutar la consulta y obtener los resultados
$result = $conexion->query("SELECT `id`, `numero_pregunta`, `subdominio`, `dominio`, `edad`, `enunciado` FROM `preguntas` WHERE `subdominio` = '$subdominio';");

// Mostrar las preguntas en una tabla HTML
if ($result->num_rows > 0) {
  
  while($row = $result->fetch_assoc()) {
    echo "<lu>";
    echo "<p>" .$row["numero_pregunta"].".  ". $row["enunciado"] . "</p>";
    echo "<li><input type='radio' name='".$row["numero_pregunta"]."' value='2'> 2</li>";
    echo "<li><input type='radio' name='".$row["numero_pregunta"]."' value='1'> 1</li>";
    echo "<li><input type='radio' name='".$row["numero_pregunta"]."' value='0'> 0</li>";
    echo "<li><input type='radio' name='".$row["numero_pregunta"]."' value='DK'> DK</li>";
    echo "</lu>";
    $contador++;
  }

} else {
  echo "No se encontraron preguntas";
}

// Cerrar la conexión
$conexion->close();

?>
