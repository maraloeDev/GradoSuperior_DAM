 package Ejemplos;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.Enumeration;

/**
 * Servlet implementation class Ejemplo6_PP
 */
@WebServlet ("/Ejemplo6_PP") //Eso es el descriptor de despliegue, si se copia y pega no funciona, y hay que poner eso
public class Ejemplo6_PP extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Ejemplo6_PP() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet# doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		response.setContentType("text/html");
		PrintWriter out = response.getWriter();
		String title = "MOSTRAR CABECERAS REQUEST";
		String docType = "<!DOCTYPE HTML PUBLIC \"-//W3C//DTD HTML 4.0 " + "Transitional//EN\">\n";
		out.println(docType + "<HTML>\n" + "<HEAD><TITLE>" + title + "</TITLE></HEAD>\n"
				+ "<BODY>\n" + "<H1 ALIGN=\"CENTER\">" + title + "</H1>\n"
				+ "<B>Request Method: </B>" + request.getMethod() + "<BR>\n" + "<B>Request URI: </B>"
				+ request.getRequestURI() + "<BR>\n" + "<B>Request Protocol: </B>" + request.getProtocol()
				+ "<BR><BR>\n" + "<TABLE BORDER=1 ALIGN=\"CENTER\">\n" + "<TR>\n"
				+ "<TH>Header Name<TH>Header Value");
		Enumeration<String> headerNames = request.getHeaderNames();
		while (headerNames.hasMoreElements()) {
			String headerName = headerNames.nextElement();
			out.println("<TR><TD>" + headerName);
			out.println(" <TD>" + request.getHeader(headerName));

		}	
	}
}
