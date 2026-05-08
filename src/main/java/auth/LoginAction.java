package auth;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import tool.Action;

public class LoginAction extends Action {
	public void execute(
			HttpServletRequest request, HttpServletResponse response
		) throws Exception {

			request.getRequestDispatcher("login.jsp")
			.forward(request, response);
	}
}
