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

@WebServlet("/ServVendor")
public class ServVendor extends HttpServlet {
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

			Long idProduto = Long.parseLong(request.getParameter("prod-vendor"));
			String nomeVendedor = request.getParameter("name-vendor");

			Usuario user = new Usuario().nameVendor(nomeVendedor);
			boolean prod = new Produto().vendor(user.getId(), idProduto);

			if (prod) {
				session.setAttribute("id-vendor", user.getId());
				session.setAttribute("vendor-name", user.getNome());
				session.setAttribute("vendor-address", user.getEndereco());
				request.getRequestDispatcher("vendor.jsp").forward(request, response);
			} else {
				request.getRequestDispatcher("main.jsp").forward(request, response);
			}
		}
	}

}
