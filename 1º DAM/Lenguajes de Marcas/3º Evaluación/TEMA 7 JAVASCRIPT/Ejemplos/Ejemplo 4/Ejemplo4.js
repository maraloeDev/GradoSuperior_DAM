window.onload = function(){
    console.log("Hola desde una funcion");
    document /* Hace referencia a la web HTML*/

/* El  innerHTML Cambia el texto de la texto*/
    document.getElementById("parrafoInicial")
    .innerHTML = "<a href='https://www.google.com' target='_blank'>Hola</a>";
    document.getElementById("btn_recuperar").onclick=recuperarN;

    boton=document.getElementsByClassName("botones");
    for (let i = 0; i < boton.length; i++) {
        boton[i].onclick=botonAlerta;
        
    }
}

function recuperarN(){

    document.getElementById("parrafo_Nombre").innerHTML
    document.getElementById("input_nombre").value
    document.getElementById("parrafo_Nombre").value=""

}

function botonAlerta(){
    alert("Pulso un boton");
}