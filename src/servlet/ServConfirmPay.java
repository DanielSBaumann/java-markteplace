package servlet;

import java.io.IOException;
import java.util.Date;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import control.Item;
import control.ListaCompra;
import control.ListaProduto;
import control.Payment;
import control.Saldo;
import control.Transacao;
import control.Usuario;

@WebServlet("/ServConfirmPay")
public class ServConfirmPay extends HttpServlet {
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

			// Informacoes de endereco
			System.out.println("#########Informacoes de endereco ##########");
			String cep = request.getParameter("main-cep");
			System.out.println("cep -> " + cep);
			String uf = request.getParameter("main-uf");
			System.out.println("uf -> " + uf);
			String cidade = request.getParameter("main-cidade");
			System.out.println("cidade-> " + cidade);
			String endereco = request.getParameter("main-endereco");
			System.out.println("endereco -> " + endereco);
			String numero = request.getParameter("main-numero");
			System.out.println("numero -> " + numero);
			String complemento = request.getParameter("main-complemento");
			System.out.println("complemento -> " + complemento);
			System.out.println("#########Informacoes de endereco ##########");
			// Informacoes de endereco

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

			// salvando informacoes de compra

			// pegando id user
			long id = Long.parseLong(session.getValue("user-id").toString());
			System.out.println("pegando id setado na session -> " + id);

			// preparando transacao
			Date data = new Date();
			Usuario user = new Usuario(id);
			double subtotal = new Item().total(lista);
			int qtd = new Item().qtd(lista);

			int idTransaction = new Transacao().transactionId(data, user, subtotal, qtd);

			// salvando informacoes de compra do cartao de credito
			Transacao tr = new Transacao(idTransaction);

			boolean pay = new Payment().payment(tr, titular, cartao, mes, ano, sec, flag);
			boolean list = new ListaProduto().save(tr, lista);
			boolean sub = new Saldo().saldoAdmin(subtotal);

			if (idTransaction > -1 && pay && list && sub) {

				System.out.println("tudo ok!! Consegui!");

				// resetando / limpando lista de compras
				new ListaCompra().resetList(user);
				session.setAttribute("lista-produtos", "[]");
				session.setAttribute("transaction", "true");

				request.getRequestDispatcher("verification.jsp").forward(request, response);
			} else {
				session.setAttribute("transaction", "false");

				request.getRequestDispatcher("verification.jsp").forward(request, response);
			}
		}
	}

}
