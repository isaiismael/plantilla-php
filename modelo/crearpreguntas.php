<?php 

$subdominio = "Expresiva";
$sql = "SELECT numero_pregunta, subdominio, dominio, edad, operador, enunciado FROM preguntas where subdominio=$subdominio";

// Ejecutar la consulta y obtener los resultados
$result = $conexion->query($sql);

// Mostrar las preguntas en una tabla HTML
if ($result->num_rows > 0) {
  echo "<form>";
  echo "<tr><th>Número de pregunta</th><th>Subdominio</th><th>Dominio</th><th>Edad</th><th>Operador</th><th>Enunciado</th></tr>";
  while($row = $result->fetch_assoc()) {
    echo "<tr>";
    echo "<td>" . $row["numero_pregunta"] . "</td>";
    echo "<td>" . $row["subdominio"] . "</td>";
    echo "<td>" . $row["dominio"] . "</td>";
    echo "<td>" . $row["edad"] . "</td>";
    echo "<td>" . $row["operador"] . "</td>";
    echo "<td>" . $row["enunciado"] . "</td>";
    echo "</tr>";
  }
  echo "</table>";
} else {
  echo "No se encontraron preguntas";
}

// Cerrar la conexión
$conn->close();
?>