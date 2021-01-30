package servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import control.Usuario;

@WebServlet("/ServUser")
public class ServUser extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		// LISTA DE COMPRAS
		String lista = request.getParameter("lista-produtos-cad");
		System.out.println(lista);
		HttpSession session = request.getSession();
		session.setAttribute("lista-produtos", lista);
		// LISTA DE COMPRAS

		String nome = request.getParameter("nome-cadastro");
		String email = request.getParameter("mail-cadastro");
		String senha = request.getParameter("senha-cadastro");

		if (new Usuario().cadastrar(nome, email, senha)) {
			request.setAttribute("check", "Cadastro adcionado com sucesso!");
			request.getRequestDispatcher("login.jsp").forward(request, response);
		} else {
			request.setAttribute("check", "Não foi possível realizar o cadastro!");
			request.getRequestDispatcher("login.jsp").forward(request, response);
		}

	}

}
