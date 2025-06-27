<?php
session_start();
if (empty($_SESSION['id'])) {
  header('location:login/login.php');
}

?>

<!-- primero se carga el topbar -->
<?php require('./layout/topbar.php'); ?>
<!-- luego se carga el sidebar -->
<?php require('./layout/sidebar.php'); ?>

<!-- inicio del contenido principal -->
<div class="page-content">
  <style>
    .grades-container {
      display: flex;
      flex-wrap: wrap;
      justify-content: center;
      gap: 20px;
      margin-top: 40px;
    }

    .grade-button {
      background-color: #3498db;
      color: white;
      border: none;
      border-radius: 10px;
      padding: 45px 50px;
      font-size: 18px;
      cursor: pointer;
      transition: all 0.3s ease;
      box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
      text-decoration: none;
      min-width: 200px;
      display: flex;
      align-items: center;
      justify-content: center;
    }

    .grade-button:hover {
      background-color: #2980b9;
      transform: translateY(-5px);
      box-shadow: 0 8px 15px rgba(0, 0, 0, 0.2);
      color: white;
    }

    .empty-message {
      color: #e74c3c;
      font-size: 18px;
      padding: 20px;
      background-color: #fdeaea;
      border-radius: 8px;
      display: inline-block;
      margin-top: 30px;
    }

    .section-title {
      color: #2c3e50;
      margin-bottom: 30px;
      font-size: 2rem;
      text-align: center;
    }

    /* Estilos para el contenedor de grado-sección */
    .grade-section-container {
      display: flex;
      flex-direction: column;
      align-items: center;
      gap: 10px;
      margin-bottom: 10px;
    }

    /* Estilos para el switch toggle */
    .switch {
      position: relative;
      display: inline-block;
      width: 60px;
      height: 30px;
    }

    .switch input {
      opacity: 0;
      width: 0;
      height: 0;
    }

    .slider {
      position: absolute;
      cursor: pointer;
      top: 0;
      left: 0;
      right: 0;
      bottom: 0;
      background-color: #ccc;
      transition: .4s;
      border-radius: 34px;
    }

    .slider:before {
      position: absolute;
      content: "";
      height: 22px;
      width: 22px;
      left: 4px;
      bottom: 4px;
      background-color: white;
      transition: .4s;
      border-radius: 50%;
    }

    input:checked+.slider {
      background-color: #2196F3;
    }

    input:focus+.slider {
      box-shadow: 0 0 1px #2196F3;
    }

    input:checked+.slider:before {
      transform: translateX(30px);
    }

    .status-text {
      font-size: 12px;
      font-weight: bold;
      margin-top: 5px;
    }

    .disabled-grade {
      opacity: 0.3;
      pointer-events: none;
    }

    ul li:nth-child(1) .activo {
      background: rgb(11, 150, 214) !important;
    }
  </style>

  <h2 class="section-title">Grados y Secciones Disponibles</h2>

  <div class="grades-container">
    <?php
    include_once '../modelo/conexion.php';
    $grado_seccion = $conexion->query("SELECT * FROM grado_seccion ORDER BY grado, seccion");
    if ($grado_seccion->num_rows > 0) {
      while ($row = $grado_seccion->fetch_object()) {
        $estado = $row->estado == '1' ? 'checked' : '';
        $disabled_class = $row->estado == '1' ? '' : 'disabled-grade';

        echo "<div class='grade-section-container'>";

        // Grade button
        echo "<a href='inicio.php?id_grado_seccion={$row->id_grado_seccion}' class='grade-button {$disabled_class}'>";
        echo "{$row->grado}° {$row->seccion}";
        echo "</a>";

        // Toggle switch
        echo "<label class='switch'>";
        echo "<input type='checkbox' {$estado} onchange='toggleGradeStatus({$row->id_grado_seccion}, this.checked)'>";
        echo "<span class='slider'></span>";
        echo "</label>";

        // Status text
        echo "<div class='status-text'>" . ($estado ? 'Habilitado' : 'Deshabilitado') . "</div>";

        echo "</div>";
      }
    } else {
      echo "<div class='empty-message'>No hay grados y secciones disponibles</div>";
    }
    ?>
  </div>

  <script>
    function toggleGradeStatus(id_grado_seccion, status) {
      // Get the event target (checkbox) and its container
      const checkbox = event.target;
      const container = checkbox.closest('.grade-section-container');
      const gradeButton = container.querySelector('.grade-button');
      const statusText = container.querySelector('.status-text');

      // Convert boolean to 1 or 0
      const estado = status ? 1 : 0;

      // Create form data
      const formData = new FormData();
      formData.append('id_grado_seccion', id_grado_seccion);
      formData.append('estado', estado);

      // Send AJAX request
      fetch('../controlador/actualizar_estado_grado.php', {
          method: 'POST',
          body: formData
        })
        .then(response => {
          if (!response.ok) {
            throw new Error('Network response was not ok');
          }
          return response.json();
        })
        .then(data => {
          console.log('Server response:', data); // Debug the response

          if (data.success) {
            // Update UI
            if (status) {
              gradeButton.classList.remove('disabled-grade');
              statusText.textContent = 'Habilitado';
            } else {
              gradeButton.classList.add('disabled-grade');
              statusText.textContent = 'Deshabilitado';
            }

            // Success notification with PNotify
            new PNotify({
              title: "CORRECTO",
              type: "success",
              text: "Estado actualizado correctamente",
              styling: "bootstrap3"
            });
          } else {
            // Error notification with PNotify
            new PNotify({
              title: "INCORRECTO",
              type: "error",
              text: data.message || "Error al actualizar el estado",
              styling: "bootstrap3"
            });
            // Revert the switch
            checkbox.checked = !status;
          }
        })
        .catch(error => {
          console.error('Error:', error);
          // Error notification with PNotify
          new PNotify({
            title: "INCORRECTO",
            type: "error",
            text: "Error en la comunicación con el servidor",
            styling: "bootstrap3"
          });
          // Revert the switch
          checkbox.checked = !status;
        });
    }
  </script>
</div>
<!-- fin del contenido principal -->


<!-- por ultimo se carga el footer -->
<?php require('./layout/footer.php'); ?>