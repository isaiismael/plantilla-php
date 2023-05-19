
document.addEventListener('DOMContentLoaded', () => {
	const preguntas = document.querySelectorAll('.contenedor-pregunta');
	window.addEventListener('load', () => {

		preguntas.forEach((pregunta, index) => {
			if (index % 2 === 0) {
				pregunta.classList.toggle('azul');
			} else {
				pregunta.classList.toggle('blanco');
			}
		});
	})

	preguntas.forEach((pregunta) => {
		pregunta.addEventListener('click', (e) => {
			e.currentTarget.classList.toggle('activa');
			const respuesta = pregunta.querySelector('.respuesta');
			const radios = respuesta.querySelectorAll('input[type="radio"]');
			const alturaRealRespuesta = respuesta.scrollHeight;


			if (!respuesta.style.maxHeight) {
				// Si esta vacio el maxHeight entonces ponemos un valor.
				respuesta.style.maxHeight = alturaRealRespuesta + 'px';
			} else {
				respuesta.style.maxHeight = null;
			}
			radios.forEach((radio) => {
				if (radio.checked) {
					e.currentTarget.classList.add('contestada');
				}
			});
			// [Opcional] Reiniciamos las demas preguntas
			preguntas.forEach((elemento) => {

				if (pregunta !== elemento) {
					elemento.classList.remove('activa');
					elemento.querySelector('.respuesta').style.maxHeight = null;
				}
			});
		});
	});
});