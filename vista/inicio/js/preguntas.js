const url = '../vista/preguntas.json';

fetch(url)
  .then(response => response.json())
  .then(data => {
    const preguntasContainer = document.getElementById("preguntas-contenedor");
    let preguntasHTML = '';

   
      preguntasHTML += `
        <h2 id="dominio">${data.dominio}</h2>
      `;

      data.subdominios.forEach(subdominio => {
        preguntasHTML += `
          <h3 id="subdominio">${subdominio.subdominio}</h3>
        `;
        let contador = 0;
        subdominio.enunciados.forEach(enunciado => {
          preguntasHTML += `
            <p>${enunciado.enunciado}</p>
              <input type="radio" name="${enunciado.enunciado}" value="${enunciado.opciones[0]}"> 
              <input type="radio" name="${enunciado.enunciado}" value="${enunciado.opciones[1]}"> 
              <input type="radio" name="${enunciado.enunciado}" value="${enunciado.opciones[2]}"> 
              <input type="radio" name="${enunciado.enunciado}" value="${enunciado.opciones[3]}"> 
          `;
          contador++;
          console.log(contador);
        });
        preguntasHTML += `<hr class="rounded">`
      });
      
    preguntasContainer.innerHTML = preguntasHTML;
  });