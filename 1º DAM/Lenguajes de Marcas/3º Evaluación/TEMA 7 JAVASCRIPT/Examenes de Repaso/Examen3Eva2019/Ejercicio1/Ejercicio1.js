window.onload=function(){
    document.getElementById("Boton").onclick = generar;
}

function generar(){
    NFi =document.getElementById("NF").value;
    NCo =document.getElementById("NC").value;

    console.log(NFi)
    console.log(NCo)

tabla =("<table border='2px'>")
for (let i = 0; i < NFi; i++) {
    tabla+=("<tr>");
    for (let j = 0; j < NCo; j++) {
        tabla+=("<td> PAPAS</td>");
        
    }
    tabla+=("</tr>");
    
}
tabla+=("</table>");
document.getElementById("tabla").innerHTML=tabla;

}