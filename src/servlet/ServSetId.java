package servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/ServSetId")
public class ServSetId extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String id = request.getParameter("id");
		System.out.println(id);
		if (id.equals("-1")) {
			HttpSession session = request.getSession();
			session.setAttribute("user-id", id);
			response.setContentType("text/html;charset=UTF-8");
			response.getWriter().write("ok");
		} else {
			response.setContentType("text/html;charset=UTF-8");
			response.getWriter().write("not ok");
		}
	}

}
