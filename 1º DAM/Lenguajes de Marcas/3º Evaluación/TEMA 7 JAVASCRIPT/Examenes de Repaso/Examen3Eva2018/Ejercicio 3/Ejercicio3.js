window.onload=function(){
 document.getElementById("fila1").onclick=f1red
 document.getElementById("fila2").onclick=f2green
 document.getElementById("fila3").onclick=f3yellow
}

function f1red(){
    document.getElementById("fila1").style.background="red";
}
function f2green(){
    document.getElementById("fila2").style.background="green";
}
function f3yellow(){
    document.getElementById("fila3").style.background="yellow";
}
