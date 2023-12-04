package AD_T1_EJER1_PASO_DE_ARGUMENTO;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;

/**
 * Servlet implementation class Ejercicio1_PASO_DE_ARGUMENTO_BIS
 */
public class Ejercicio1_PASO_DE_ARGUMENTO_2 extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Ejercicio1_PASO_DE_ARGUMENTO_2() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		response.setContentType("text/html");
		
		if(request.getParameter("idioma").equals("es")) {
			response.getWriter().append("El idioma escrito es español");
			
		} else if(request.getParameter("idioma").equals("de")) {
			response.getWriter().append("El idioma escrito es aleman");
			
		 } else if(request.getParameter("idioma").equals("en")) {
			response.getWriter().append("El idioma escrito es ingles");
		} else {
			response.getWriter().append("Idiom no encontrado");
		}
		response.getWriter().close();
	}

}
