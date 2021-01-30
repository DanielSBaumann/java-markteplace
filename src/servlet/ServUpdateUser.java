package servlet;

import java.io.IOException;
import java.util.Date;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import control.Usuario;

@WebServlet("/ServUpdateUser")
public class ServUpdateUser extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		HttpSession session = request.getSession();
		Object aux = session.getAttribute("user-id");
		if (aux == null) {
			response.sendRedirect("login.jsp");
		} else {
			long id = Long.parseLong(request.getParameter("id"));
			String cpf = request.getParameter("cpf");

			String dt = request.getParameter("niver");
			dt = dt.substring(5, 7) + "/" + dt.substring(8, 10) + "/" + dt.substring(0, 4);
			Date data = new Date(dt);

			String telefone = request.getParameter("telefone");
			String cep = request.getParameter("cep");
			String uf = request.getParameter("uf");
			String cidade = request.getParameter("cidade");
			String endereco = request.getParameter("endereco");
			
			// LISTA DE COMPRAS
			String lista = request.getParameter("lista-produtos");
			session.setAttribute("lista-produtos", lista);
			// LISTA DE COMPRAS

			if (new Usuario().update(data, id, cpf, telefone, cep, uf, cidade, endereco)) {
				System.out.println("UPDATE sucesso");
				request.getRequestDispatcher("cadastrousuario.jsp").forward(request, response);
			} else {
				System.out.println("UPDATE Falha");
				request.getRequestDispatcher("cadastrousuario.jsp").forward(request, response);
			}
		}
	}

}
