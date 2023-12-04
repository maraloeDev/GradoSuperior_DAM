package Ejemplos;

import jakarta.servlet.ServletConfig;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;

/**
 * Servlet implementation class Ejemplo3
 */
public class Ejemplo3_PP extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Ejemplo3_PP() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see Servlet#init(ServletConfig)
	 */
	public void init(ServletConfig config) throws ServletException {
		// Este metodo, inicializa el funcionamiento del servlet
	}

	/**
	 * @see Servlet#destroy()
	 */
	public void destroy() {
		// Este metodo sirve para que si el servlet no recibe ninguna petición, se destruye
	}

	/**
	 * @see HttpServlet#service(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		//Se usan dos metodos: 
		
			//setContentType(): sirve para establecer el tipo de respuesta (Si se trata de una pagina web, utilizaremos (text/html))
		
			//PrinterWriter : sirve para escribir los datos que queremos que el cliente reciba
	}

}
