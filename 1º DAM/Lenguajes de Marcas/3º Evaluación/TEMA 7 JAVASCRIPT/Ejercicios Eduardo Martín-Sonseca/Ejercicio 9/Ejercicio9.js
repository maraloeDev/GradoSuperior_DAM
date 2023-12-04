window.onload=function(){
    texto = document.getElementsByTagName("input");

    for (let i = 0; i < texto.length; i++) {
        texto[i].onfocus=function cambiarFoco(){
            this.style.backgroundColor="yellow";
        }
        
    }

    for (let i = 0; i < texto.length; i++) {
        texto[i].onblur=function cambiarFoco(){
            this.style.backgroundColor="white";
        }
        
    }
}