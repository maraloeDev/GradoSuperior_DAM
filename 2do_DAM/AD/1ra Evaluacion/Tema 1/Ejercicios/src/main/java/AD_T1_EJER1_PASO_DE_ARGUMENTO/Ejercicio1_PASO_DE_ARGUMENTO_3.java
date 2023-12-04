package AD_T1_EJER1_PASO_DE_ARGUMENTO;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;

/**
 * Servlet implementation class Ejercicio1_PASO_DE_ARGUMENTO_3
 */
public class Ejercicio1_PASO_DE_ARGUMENTO_3 extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Ejercicio1_PASO_DE_ARGUMENTO_3() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		response.setContentType("text/html");
		
		switch(request.getParameter("idioma")) {
		
		case "español" :
			response.getWriter().append("Hola Mundo");
			break;
			
		case "ingles" :
			response.getWriter().append("Hello World");
			break;
			
		case "italiano" :
			response.getWriter().append("Ciao a tutti");
			break;
			
		case "frances" :
			response.getWriter().append("Bonjour Tout");
			break;
		}
		
		response.getWriter().close();
	}

}
