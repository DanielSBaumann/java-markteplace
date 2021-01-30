package servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/ServSign")
public class ServSign extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		HttpSession session = request.getSession();
//
		Object aux = session.getAttribute("user-id");
		System.out.println("AUX -> " + aux);
		System.out.println("id -> " + session.getAttribute("user-id"));

//		response.setContentType("text/html;charset=UTF-8");
//		response.getWriter().write(aux);

//		Object aux = session.getAttribute("user-id");
//		if (aux == null) {
//			// rotina login
//		} else {
//			// fazer find com user com id de auxiliar e direcionar a page de menu
//		}
	}

}
