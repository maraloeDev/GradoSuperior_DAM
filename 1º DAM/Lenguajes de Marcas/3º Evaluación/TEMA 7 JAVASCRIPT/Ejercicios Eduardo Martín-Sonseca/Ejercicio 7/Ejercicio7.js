window.onload = function(){

}

function calcularCaracteres(obj) {
  text = String(obj.value);
  numCaracteres = 100 - text.length;
  document.getElementById("num").innerHTML = numCaracteres;

}