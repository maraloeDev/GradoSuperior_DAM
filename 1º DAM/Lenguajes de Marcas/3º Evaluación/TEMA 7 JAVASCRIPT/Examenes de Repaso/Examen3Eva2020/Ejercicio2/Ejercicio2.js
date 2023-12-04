window.onload=function(){
var punto1y = document.getElementById("coordenada1y").value;
var punto2y = document.getElementById("coordenada2y").value;
var punto3y = document.getElementById("coordenada3y").value;

var punto1x = document.getElementById("coordenada1x").value;
var punto2x = document.getElementById("coordenada1x").value;
var punto3x = document.getElementById("coordenada3x").value;


document.getElementById("coordenadas1").innerHTML=("Punto 1 :(" + punto1y + ", " + punto1x + ")");
document.getElementById("coordenadas2").innerHTML=("Punto 2 :(" + punto2y + ", " + punto2x + ")");
document.getElementById("coordenadas3").innerHTML=("Punto 3 :(" + punto3y + ", " + punto3x + ")");


document.getElementById("sumarTodo1").innerHTML=("Suma Punto X :(" + (parseInt(punto1x)  + parseInt(punto2x) + parseInt(punto3x)) + ")");
document.getElementById("sumarTodo2").innerHTML=("Suma Punto Y :(" + (parseInt(punto1y)  + parseInt(punto2y) + parseInt(punto3y)) + ")");


}

