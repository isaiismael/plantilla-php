document.addEventListener('DOMContentLoaded', () => {
  const formulario = document.getElementById('preguntas-contenedor');
  let contador = 0;
  
  /*
  formulario.addEventListener('submit', (evento) => {
    evento.preventDefault();
  });
*/

/* agrega a un evento que hace que cada vez que cambian un radio evalue cual es su valor y mira cuando se debe mirar
*/
  formulario.addEventListener('change', () => {
    const opciones = formulario.querySelectorAll('input[type="radio"]');
    let valorSeleccionado = '';
    let cantidad2 = 0;
    let cantidad1 = 0;
    let cantidadDK = 0;
    let reglasbasal = 0;
  
    opciones.forEach((opcion) => {
      if (opcion.checked) {
        valorSeleccionado = opcion.value;
      }
    });
  
    if (valorSeleccionado === '0') {
      contador++;
  
      if (contador === 4) {
    
        formulario.submit();
      }
    }else if(valorSeleccionado === '1'){
      cantidad1++
    }
    else if(valorSeleccionado === '2'){
      cantidad2++
    }else if(valorSeleccionado === 'DK'){
      cantidadDK++
    }   
    else {
      contador = 0;
    }
  });
// reglas basal, primero revisa todos los radios checados los mete a un array y despues los recorre buscando 
  const radios = document.querySelectorAll('input[type="radio"]:checked');
  const respuestas = [];
  for (let i = 0; i < radios.length; i++) {
    respuestas.push(radios[i].value);
  }
  let reglaBasal = false;
  for (let i = 0; i < respuestas.length - 3; i++) {
    if (respuestas[i] === respuestas[i+1] && respuestas[i] === respuestas[i+2] && respuestas[i] === respuestas[i+3]) {
      reglaBasal = true;
      break;
    }
  }

  
  if (reglaBasal) {
    formulario.submit();
  }
      

});