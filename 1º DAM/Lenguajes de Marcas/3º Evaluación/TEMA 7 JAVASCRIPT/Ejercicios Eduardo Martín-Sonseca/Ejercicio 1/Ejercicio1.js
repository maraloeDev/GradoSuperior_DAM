window.onload = function(){ /* Sirve para que se cargue entera la página web */

document.getElementById("ganondorfa").onchange=cambiarFondo;

}

function cambiarFondo() {
        color = this.value;
        document.body.style.backgroundColor = color;
        
    }