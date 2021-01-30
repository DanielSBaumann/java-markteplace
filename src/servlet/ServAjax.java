package servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import control.Usuario;

@WebServlet("/ServAjax")
public class ServAjax extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String email = request.getParameter("email");
		if (!new Usuario().mail(email)) {
			response.setContentType("text/html;charset=UTF-8");
			response.getWriter().write("ok");
		} else {
			response.setContentType("text/html;charset=UTF-8");
			response.getWriter().write("not ok");
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String email = request.getParameter("email");
		if (new Usuario().mail(email)) {
			response.setContentType("text/html;charset=UTF-8");
			response.getWriter().write("ok");
		} else {
			response.setContentType("text/html;charset=UTF-8");
			response.getWriter().write("not ok");
		}
	}

}
