window.onload=function(){
document.getElementById("Generar").onclick= generar;
document.getElementById("Cambiar").onclick= cambiar;
}

function generar(){

    valorP = document.getElementById("parrafosSeleccionar").value;
    parrafos="";
for (let i = 0; i <= valorP; i++) {
    
    parrafos= parrafos +  "<p>"+ " Lorem ipsum " + "</p>"
}
document.getElementById("parr").innerHTML=parrafos;
}

function cambiar(){

    valorP = document.getElementById("parrafosSeleccionar").value;
    parrafos="";
for (let i = 1; i <= valorP; i++) {
    
    parrafos= parrafos +  "<ul><ol><p>"+ i + " Lorem ipsum " + "</p></ol></ul>"
}
document.getElementById("parr").innerHTML=parrafos;
}
