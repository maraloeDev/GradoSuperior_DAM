package Ejercicio1;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;

/**
 * Servlet implementation class Ejercicio1
 */
public class Ejercicio1 extends HttpServlet {
	private static final long serialVersionUID = 1L;

    /**
     * Default constructor. 
     */
    public Ejercicio1() {
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
    
    /* He creado este ejercicio con el metodo doPost, debido a que los datos se tiene que ver
     en la propia página y no desde la url */
    
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String nombre = request.getParameter("nombre");
		String apellidos =request.getParameter("apell");
		String productos =request.getParameter("productos");
		String pagos =request.getParameter("pago");
		String factura =request.getParameter("factura");
		
		response.getWriter().append("Solicitante: " + "\t" + nombre + " " + apellidos)
							.append("\n")
							.append("Listado compra: " + "\t" + productos)
							.append("\n")
							.append("Pagado por: " + "\t" + pagos)
							.append("\n")
							.append("Pagado por: " + "\t" + factura)
							.close();
		
		
		}

}
