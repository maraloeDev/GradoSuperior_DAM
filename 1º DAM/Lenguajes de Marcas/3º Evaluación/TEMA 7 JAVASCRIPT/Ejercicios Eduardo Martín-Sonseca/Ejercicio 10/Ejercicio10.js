window.onload=function(){
    y = document.getElementById("Coordenaday").value;
    x = document.getElementById("Coordenadax").value;
    mover = document.getElementById("MoverCoordenadas").value;

    document.getElementById("btnMover").onclick=MovimientoSeXY;

    function MovimientoSeXY(){
        document.getElementById("infoCoordenadas").innerHTML = "<p> <b>Y</b> : " +
        ( parseInt(y) + parseInt(mover)) + "<br> <b>X</b> : " +
        (parseInt(x)+ parseInt(mover)) +  "</p>"
    }
}