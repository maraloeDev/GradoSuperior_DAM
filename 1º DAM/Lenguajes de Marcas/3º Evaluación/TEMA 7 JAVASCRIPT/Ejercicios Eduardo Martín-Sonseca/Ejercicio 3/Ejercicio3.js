window.onload = function(){
document.getElementById("iz").onclick=alineacion
document.getElementById("der").onclick=alineacion
document.getElementById("cen").onclick=alineacion
document.getElementById("jus").onclick=alineacion
}

function alineacion(){
    alinea = this.value;
    parrafos=document.getElementsByTagName("p");
            for(i=0;i<parrafos.length;i++){
                parrafos[i].style.textAlign=alinea;
            }
}