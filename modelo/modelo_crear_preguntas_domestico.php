<?php 
$subdominio = "Domestico";
$contador = 0;
// Ejecutar la consulta y obtener los resultados
$result = $conexion->query("SELECT `id`, `numero_pregunta`, `subdominio`, `dominio`, `edad`, `enunciado` FROM `preguntas` WHERE `subdominio` = '$subdominio';");

// Mostrar las preguntas en una tabla HTML
if ($result->num_rows > 0) {
  
  while($row = $result->fetch_assoc()) {
   
    echo "<div class='contenedor-pregunta'>";
    echo "<p class='pregunta'>" .$row["numero_pregunta"].".  ". $row["enunciado"] ."<i class='fa-solid fa-chevron-down' style='color: #2967d1;'></i></p>";
    echo "<div class='respuesta'>";
    echo "<lu>";
    echo "<li><input type='radio' name='".$row["numero_pregunta"]."' value='2'> 2</li>";
    echo "<li><input type='radio' name='".$row["numero_pregunta"]."' value='1'> 1</li>";
    echo "<li><input type='radio' name='".$row["numero_pregunta"]."' value='0'> 0</li>";
    echo "<li><input type='radio' name='".$row["numero_pregunta"]."' value='DK'> DK</li>";
    echo "</lu>";
    echo "</div>";
    echo "</div>";
    $contador++;
  }

} else {
  echo "No se encontraron preguntas";
}

// Cerrar la conexión
$conexion->close();

?>
