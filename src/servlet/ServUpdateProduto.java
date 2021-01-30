package servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import control.Produto;

@WebServlet("/ServUpdateProduto")
public class ServUpdateProduto extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		HttpSession session = request.getSession();
		long id = Long.parseLong(session.getAttribute("meu-prod-id").toString());
		int qtd = Integer.parseInt(request.getParameter("qtd"));
		int desconto = Integer.parseInt(request.getParameter("desconto"));
		String disp = request.getParameter("dispo");
		boolean ativo = disp.toLowerCase().equals("true") ? true : false;
		
		// LISTA DE COMPRAS
		String lista = request.getParameter("lista-produtos");
		session.setAttribute("lista-produtos", lista);
		// LISTA DE COMPRAS

		if (new Produto().updateProduto(id, qtd, desconto, ativo)) {
			System.out.println("update produto ok");
			request.getRequestDispatcher("cadastroproduto.jsp").forward(request, response);
		} else {
			System.out.println("update produto falhou");
			request.getRequestDispatcher("cadastroproduto.jsp").forward(request, response);
		}
	}

}
