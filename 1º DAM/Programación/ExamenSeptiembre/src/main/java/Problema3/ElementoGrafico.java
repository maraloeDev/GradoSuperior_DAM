package Problema3;

public interface ElementoGrafico {
    
    void dibujar(); //muestra por consola que se está dibujando el elemento gráfico de nombre <nombre>
    ElementoGrafico clonar(); //crea un nuevo elemento gráfico con las mismas propiedades que el objeto actual.
    void ampliar(int pixeles); //aumenta el tamaño del elemento gráfico actual en el nº de píxeles indicado.
    boolean esComercial(); //devuelve cierto si el elemento gráfico es alguno de los recogidos en la tabla 'simbolos.png'
    
}
