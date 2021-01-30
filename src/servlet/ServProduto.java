package servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import control.Produto;
import control.Usuario;

@WebServlet("/ServProduto")
public class ServProduto extends HttpServlet {
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
			session.setAttribute("lista-produtos", lista);
			// LISTA DE COMPRAS

			String nome = request.getParameter("nome-produto");
			String descricao = request.getParameter("descricao-produto");
			String marca = request.getParameter("marca-produto");
			String categoria = request.getParameter("categoria-produto");
			double preco = Double.parseDouble(request.getParameter("preco-produto"));
			int quantidade = Integer.parseInt(request.getParameter("quantidade-produto"));

			// ############IMAGENS######################
			String img1 = request.getParameter("imagem-produto-1");
			String img2 = request.getParameter("imagem-produto-2");
			String img3 = request.getParameter("imagem-produto-3");
			String img4 = request.getParameter("imagem-produto-4");
			// ############IMAGENS######################

			Usuario usuario = new Usuario();
			usuario.setId(Long.parseLong(session.getAttribute("user-id").toString()));

			if (new Produto().cadastrar(usuario, nome, descricao, marca, categoria, img1, img2, img3, img4, preco,
					quantidade)) {
				System.out.println("Produto cadastrado!");
				request.getRequestDispatcher("produto.jsp").forward(request, response);
			} else {
				System.out.println("Erro!");
				request.getRequestDispatcher("main.jsp").forward(request, response);
			}
		}

	}

}
