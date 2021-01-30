package servlet;

import java.io.IOException;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import control.Item;
import control.ListaCompra;
import control.Produto;
import control.Usuario;

@WebServlet("/ServLogin")
public class ServLogin extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		String email = request.getParameter("mail-login");
		String senha = request.getParameter("senha-login");
		String sign = request.getParameter("sign");

		System.out.println("sign -> " + sign);

		Usuario user = new Usuario();
		if (user.login(email, senha)) {
			HttpSession session = request.getSession(true);
			session.setAttribute("user-id", user.getId());
			// LISTA DE COMPRAS
			String lista = request.getParameter("lista-produtos-lg");
			if (lista.equals("[]") || lista.equals("")) {
				ListaCompra lc = new ListaCompra().lista((int) user.getId());
				if (lc == null) {
					session.setAttribute("lista-produtos", lista);
				} else {
					session.setAttribute("lista-produtos", lc.getLista());
				}
				session.setMaxInactiveInterval(15 * 60 * 1000);
				request.getRequestDispatcher("main.jsp").forward(request, response);
			} else {
				List<Integer> idList = new Produto().idList(user.getId());
				String json = new Item().jsonRoutine(lista, idList);
				ListaCompra lc = new ListaCompra().lista((int) user.getId());
				if (lc == null || lc.getLista().equals("[]") || lc.getLista().equals("")) {

					new ListaCompra().updateList((int) user.getId(), json);
					session.setAttribute("lista-produtos", json);
				} else {
					String listaFinal = new Item().finalList(json, lc.getLista());
					new ListaCompra().updateList((int) user.getId(), listaFinal);
					session.setAttribute("lista-produtos", listaFinal);
				}
				session.setMaxInactiveInterval(15 * 60 * 1000);
				request.getRequestDispatcher("main.jsp").forward(request, response);
			}
		} else {
			request.setAttribute("fail", "erro");
			request.getRequestDispatcher("login.jsp").forward(request, response);
		}

	}

}
