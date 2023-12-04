window.onload=function(){
    texto = document.getElementsByTagName("input");

Nombre =document.getElementById("nombre").value;
Apellido = document.getElementById("apellido").value;
Correo =document.getElementById("correo").value;

    for (let i = 0; i < texto.length; i++) {
        texto[i].onfocus=function cambiarFoco(){
            this.style.backgroundColor="red";
        }
        
    }

    for (let i = 0; i < texto.length; i++) {
        texto[i].onblur=function cambiarFoco(){
            this.style.backgroundColor="white";
        }
        
    }

    document.getElementById("Enviar").onclick= datos;

    function datos(){
        document.getElementById("MostrarDatos").innerHTML=("<p>Los datos enviados son : </p> <br>  Nombre " + Nombre + "<br>" + "Apellidos " + Apellido + "<br>" + "Correo " + Correo);    
    }
}