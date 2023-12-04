document.write("Hola Mundo en JavaScript");

nombre = " Eduardo"

document.write("<br>" + nombre +"</br>" );

for (let i = 0; i <= 6; i++) {
    document.write("<h" + i + "> Hola Mundo en JavaScript</h" + i +" >");
    
}
document.write("-----------------------------------------------------------------------------");

document.write("<BR> ES UN EJEMPLITO");

cambioMultiplicar = prompt("Introduce un numero");
document.write("<h1>TABLA DEL " + cambioMultiplicar + "</h1>");

document.write("<table border="+1+ ">");
for (let i = 0; i <= 10; i++) {
    
    document.write("<tr>" +
        "<td>" + cambioMultiplicar + " X " + i + " = " + "<b>" + (i*cambioMultiplicar) +"</b>"+ "</td>" +"</tr>");
}
document.write("</table>");