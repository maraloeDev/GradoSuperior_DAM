window.onload = function(){
    document.getElementById("zelda").onchange=cambiarTexto;
}

function cambiarTexto(){
    txt= this.value;
    parrafo = document.getElementById("Doraemaon");
        parrafo.innerHTML ="<h1>" + txt + "</h1>";

}