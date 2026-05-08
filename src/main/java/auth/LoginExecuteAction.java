package auth;

import bean.Teacher;
import dao.TeacherDAO;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import tool.Action;

public class LoginExecuteAction extends Action {
	public void execute(
		HttpServletRequest request, HttpServletResponse response
	) throws Exception {

		HttpSession session=request.getSession();

		String id=request.getParameter("id");
		String password=request.getParameter("password");
		

		TeacherDAO dao=new TeacherDAO();
		Teacher teacher=dao.login(id, password);
		
		if (teacher != null) {
			session.setAttribute("teacher", teacher);

			request.getRequestDispatcher("Menu.action")
			       .forward(request, response);
		} else {
			String message = "IDまたはパスワードが正しくありません。";
			request.setAttribute("message", message);

			request.getRequestDispatcher("login.jsp")
			       .forward(request, response);
		}
	}
}
