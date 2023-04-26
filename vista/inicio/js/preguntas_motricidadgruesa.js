document.addEventListener('DOMContentLoaded', () => {
    const formulario = document.getElementById('preguntas-contenedor');
    let contador = 0;
    let cantidad0 = 0;
    let cantidad1 = 0;
    let cantidadDK = 0;
    let idreglabasal = -1;
  
    function ReglaBasal() {
  
      const valor1 = document.getElementById("m1");
      const valor0 = document.getElementById("m0");
      const valor2 = document.getElementById("mregla");
      const valordk = document.getElementById("mdk");
      const total = document.getElementById("total");
      const respuestas = [];
      const radios = document.querySelectorAll('input[type="radio"]:checked');
      for (let i = 0; i < radios.length; i++) {
        respuestas.push(radios[i].value);
      }
      let reglaBasal = false;
      for (let i = radios.length; i >= 0; i--) {
        if (respuestas[i] === '2') {
          if (respuestas[i] === respuestas[i - 1] && respuestas[i] === respuestas[i - 2] && respuestas[i] === respuestas[i - 3]) {
            reglaBasal = true;
            idreglabasal = (i - 3);
            break;
          }
        }
      }
  
      if (reglaBasal == true) {
        if (idreglabasal !== -1) {
  
          for (let i = idreglabasal + 4; i <= radios.length; i++) {
            if (respuestas[i] === '0') {
              cantidad0++;
            }
            if (respuestas[i] === '1') {
              cantidad1 = cantidad1 + parseInt(respuestas[i]);
            }
            if (respuestas[i] === '2') {
              cantidad1 = cantidad1 + parseInt(respuestas[i]);
            }
            if (respuestas[i] === 'DK') {
              cantidadDK++
            }
          }
          let item_antesbasal = idreglabasal * 2;
  
          valor1.value = cantidad1;
          valor2.value = item_antesbasal;
          valor0.value = cantidad0;
          valordk.value = cantidadDK;
          total.value = parseInt(valor1.value) + parseInt(valor2.value) + parseInt(valor0.value) + parseInt(valordk.value);
  
         
        }
  
      }
      else if (reglaBasal == false) {
        for (let i = radios.length; i >= 0; i--) {
          if (respuestas[i] === '0') {
            cantidad0++;
          }
          else if (respuestas[i] === '1') {
            cantidad1 = cantidad1 + parseInt(respuestas[i]);
          }
          else if (respuestas[i] === '2') {
            cantidad1 = cantidad1 + parseInt(respuestas[i]);
          }
          else if (respuestas[i] === 'DK') {
            cantidadDK++;
          }
        }
  
        valor1.value = cantidad1;
        valor2.value = 0;
        valor0.value = cantidad0;
        valordk.value = cantidadDK;
        total.value = parseInt(valor1.value) + parseInt(valor2.value) + parseInt(valor0.value) + parseInt(valordk.value);
      }
    }
  
    document.getElementById("btnevaluar").addEventListener("click", function(event) {
      // Hacer algo aquí, como mostrar una alerta o hacer una llamada AJAX
      event.preventDefault();
      ReglaBasal();
      // Redirigir al usuario a otra página
      if (confirm('¿Desea continuar?')) {
        const total = document.getElementById("total").value;
        window.location.href= 'motricidad_fina.php?total='+total;
      }
    });
    // necesito que cuando este la regla basal solamente en ese momento se empize a contar 
    /* agrega a un evento que hace que cada vez que cambian un radio evalue cual es su valor y mira cuando se debe mirar
    */
    formulario.addEventListener('change', () => {
      const opciones = document.querySelectorAll('input[type="radio"]');
      let valorSeleccionado = '';
  
      opciones.forEach((opcion) => {
        if (opcion.checked) {
          valorSeleccionado = opcion.value;
        }
      });
  
      if (valorSeleccionado === '0') {
        contador++;
        if (contador === 4) {
          if (confirm("Se detectaron 4 '0' seguidos desea continuar con el proximo menu?: ")) {
            ReglaBasal();
            if (confirm('¿Desea continuar?')) {
              const total = document.getElementById("total").value;
              window.location.href= 'motricidad_fina.php?total='+total;
            }
          }
        }
      } else {
        contador = 0;
      }
    });
    // reglas basal, primero revisa todos los radios checados los mete a un array y despues los recorre buscando 
  
  
  });
  
  