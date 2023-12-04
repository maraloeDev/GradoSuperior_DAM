window.onload=function(){
document.getElementById("boton").onclick = mostrarol
document.getElementById("boton").ondblclick = mostrarli
}

function mostrarol(){
    datos="";
for (let i = 1; i <= 10; i++) {
        datos+=( "<ul><li>" +"Dato</li></ul>");
    
}
document.getElementById("cambios").innerHTML=datos
}

function mostrarli(){
    datos="";
for (let i = 1; i <= 10; i++) {
        datos+=( "<ul><ol>" + i +". dato" + "</ol></ul>");
    
}
document.getElementById("cambios").innerHTML=datos
}