package classnum;

import bean.ClassNum;
import bean.Teacher;
import dao.ClassNumDAO;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import tool.Action;

public class ClassUpdateAction extends Action {

    @Override
    public void execute(HttpServletRequest request, HttpServletResponse response) throws Exception {

        HttpSession session = request.getSession(false);
        if (session == null || session.getAttribute("teacher") == null) {
            response.sendRedirect("../auth/Login.action");
            return;
        }

        Teacher teacher = (Teacher) session.getAttribute("teacher");

        String classNumStr = request.getParameter("class_num");

        ClassNumDAO dao = new ClassNumDAO();
        ClassNum classNum = dao.get(classNumStr, teacher.getSchool_cd());

        if (classNum == null) {
            response.sendRedirect("ClassList.action");
            return;
        }

        request.setAttribute("classNum", classNum);

        request.getRequestDispatcher("class_update.jsp")
               .forward(request, response);
    }
}