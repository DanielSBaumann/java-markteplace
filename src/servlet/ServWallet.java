package servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/ServWallet")
public class ServWallet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		HttpSession session = request.getSession();
		Object aux = session.getAttribute("user-id");
		if (aux == null) {
			response.sendRedirect("login.jsp");
		} else {

			// LISTA DE COMPRAS
			String lista = request.getParameter("lista-produtos");
			System.out.println(lista);
			session.setAttribute("lista-produtos", lista);
			// LISTA DE COMPRAS

			request.getRequestDispatcher("wallet.jsp").forward(request, response);
		}
	}

}
