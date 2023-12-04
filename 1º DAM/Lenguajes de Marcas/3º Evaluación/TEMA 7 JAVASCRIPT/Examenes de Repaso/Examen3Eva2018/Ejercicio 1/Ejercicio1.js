window.onload=function(){

}

function ocultarMostrar(enlace,parrafo){

    if(enlace.value == true){

        document.getElementById(parrafo).style.display='none';
        enlace.textContent="Mostrar Contenidos";
        enlace.value=false
} else{
    document.getElementById(parrafo).style.display='block';
        enlace.textContent="Ocultar Contenidos";
        enlace.value= true
}
}