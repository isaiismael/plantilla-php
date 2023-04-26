const $grafica = document.querySelector("#myChart");

const etiquetas = ["Receptiva","Expresiva","Escritura"]

const datosdominios = {
    label: "Vscore por medio de raw score",
    data:[21,24,26],
    backgroundColor: 'rgba(54,162,235,0.2)',
    borderColor: 'rgba(54,162,235,1)',
    borderWidth:1,

};
new Chart($grafica,{
    type:"line",
    data: {
        labels:etiquetas,
        datasets:[
            datosdominios
    ]
    },
    options:{
        scales:{
            yAxes:[{
                ticks:{
                    beginAtZero:1
                }
            }],
        },
    }
});

