package servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import control.ListaCompra;

@WebServlet("/ServUpdateKart")
public class ServUpdateKart extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		HttpSession session = request.getSession();
		int id = Integer.parseInt(session.getAttribute("user-id").toString());
		String lista = request.getParameter("lista");
		if (new ListaCompra().updateList(id, lista)) {
			response.setContentType("text/html;charset=UTF-8");
			response.getWriter().write("ok");
		} else {
			response.setContentType("text/html;charset=UTF-8");
			response.getWriter().write("not ok");
		}
	}

}
