document.addEventListener('DOMContentLoaded', () => {
  const formulario = document.getElementById('preguntas-contenedor');
  let contador = 0;

  formulario.addEventListener('submit', (evento) => {
    evento.preventDefault();
  });

  formulario.addEventListener('change', () => {
    const opciones = formulario.querySelectorAll('input[type="radio"]');
    let valorSeleccionado = '';
  
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
    } else {
      contador = 0;
    }
  });

});