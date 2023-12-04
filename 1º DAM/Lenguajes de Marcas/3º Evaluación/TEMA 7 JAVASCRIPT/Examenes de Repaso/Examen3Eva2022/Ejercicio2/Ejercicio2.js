window.onload=function(){

}

var arrayN = [];

for (let i = 1; i <= 4; i++) {
    var datos = prompt("Introduce un dato");
    arrayN.push(datos);
}

var x=0;

for (let i = 0; i < arrayN.length; i++) {
    x+=arrayN[i];
    
}

var x = document.write=("El valor acumulado de todos los elementos del vector es de " + x);

var y =0;
for (let i = 0; i < arrayN.length; i++) {
    if (arrayN > 36){
        y+=arrayN[i]
    }
    
}
var y = document.write=("El valor acumulado de los elementos del vector que sean mayores a 36 " + y );

var z =0

for (let i = 0; i < arrayN.length; i++) {
    if (arrayN > 50){
        z++
    }

    var z = document.write="Cantidad de valores mayores a 50 " + z;
    
}
console.log(x)
console.log(y)
console.log(z)