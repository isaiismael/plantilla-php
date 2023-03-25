const url = '../vista/preguntas.json';

fetch(url)
  .then(response => response.json())
  .then(data => {
    const preguntasContainer = document.getElementById("preguntas-contenedor");
    let preguntasHTML = '';

   
      preguntasHTML += `
        <h2 id="$data.dominio">${data.dominio}</h2>
      `;

      data.subdominios.forEach(subdominio => {
        preguntasHTML += `
          <h3 id="$subdominio.subdominio">${subdominio.subdominio}</h3>
        `;

        subdominio.enunciados.forEach(enunciado => {
            preguntasHTML += `
            <p>${enunciado.enunciado}</p>
            <ul>
              <li><input type="radio" name="$enunciado.enunciado"> ${enunciado.opciones[0]}</li>
              <li><input type="radio" name="$enunciado.enunciado"> ${enunciado.opciones[1]}</li>
              <li><input type="radio" name="$enunciado.enunciado"> ${enunciado.opciones[2]}</li>
              <li><input type="radio" name="$enunciado.enunciado"> ${enunciado.opciones[3]}</li>
            </ul>
          `;
        });
        preguntasHTML += `<hr class="rounded">`
      });
      
    preguntasContainer.innerHTML = preguntasHTML;
  });
