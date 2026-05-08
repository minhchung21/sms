package auth;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import tool.Action;

public class MenuAction extends Action {
	public void execute(
			HttpServletRequest request, HttpServletResponse response
		) throws Exception {

			request.getRequestDispatcher("/menu.jsp")
			.forward(request, response);
	}
}
