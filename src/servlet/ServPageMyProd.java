package servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/ServPageMyProd")
public class ServPageMyProd extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		HttpSession session = request.getSession();
		Object aux = session.getAttribute("user-id");
		if (aux == null) {
			response.sendRedirect("login.jsp");
		} else {
			String id = request.getParameter("id-prod");
			session.setAttribute("meu-prod-id", id);

			// LISTA DE COMPRAS
			String lista = request.getParameter("lista-produtos");
			session.setAttribute("lista-produtos", lista);
			// LISTA DE COMPRAS

			request.getRequestDispatcher("cadastroproduto.jsp").forward(request, response);
		}
	}

}
