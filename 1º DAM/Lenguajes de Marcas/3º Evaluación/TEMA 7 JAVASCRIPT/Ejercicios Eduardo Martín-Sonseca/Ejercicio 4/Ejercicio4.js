window.onload = function(){

}
cambioMultiplicar = prompt("Introduce un numero");
document.write("<h1>TABLA DEL " + cambioMultiplicar + "</h1>");

document.write("<table border="+1+ ">");
for (let i = 0; i <= 3; i++) {
    
    document.write("<tr>" +
        "<td>" + cambioMultiplicar + " X " + i + " = " + "<b>" + (i*cambioMultiplicar) +"</b>"+ "</td>" +"</tr>");
}
document.write("</table>");