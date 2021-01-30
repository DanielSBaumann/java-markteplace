package servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import control.CartaoUsuario;
import control.Usuario;

@WebServlet("/ServSaveCard")
public class ServSaveCard extends HttpServlet {
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

			// Informacoes Financeiras
			System.out.println("#########Informacoes Financeiras ##########");
			String titular = request.getParameter("main-titular");
			System.out.println("titular -> " + titular);
			String cartao = request.getParameter("main-card");
			System.out.println("num cartao  -> " + cartao);
			String mes = request.getParameter("main-mes");
			System.out.println("mes cartao -> " + mes);
			String ano = request.getParameter("main-ano");
			System.out.println("ano cartao  -> " + ano);
			String sec = request.getParameter("main-sec");
			System.out.println("numero seguranca  -> " + sec);
			String flag = request.getParameter("main-flag");
			System.out.println("Flag cartao  -> " + flag);
			System.out.println("#########Informacoes de Financeiras ##########");
			// Informacoes Financeiras

			Usuario user = new Usuario(Long.parseLong(session.getValue("user-id").toString()));
			if (new CartaoUsuario().save(user, titular, cartao, mes, ano, sec, flag)) {
				System.out.println("Deu certo");
			} else {
				System.out.println("Deu errado");
			}

			// alterar apos ajustes
			request.getRequestDispatcher("wallet.jsp").forward(request, response);
		}
	}

}
