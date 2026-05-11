package classnum;

import java.util.List;

import bean.Teacher;
import dao.ClassNumDAO;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import tool.Action;

public class ClassListAction extends Action {

    @Override
    public void execute(
            HttpServletRequest request,
            HttpServletResponse response
    ) throws Exception {

        // ===== session check =====
        HttpSession session = request.getSession(false);

        if (session == null || session.getAttribute("teacher") == null) {
            response.sendRedirect("../auth/Login.action");
            return;
        }

        Teacher teacher =
                (Teacher) session.getAttribute("teacher");

        // ===== DAO =====
        ClassNumDAO dao = new ClassNumDAO();

        // ===== class list =====
        List<String> list =
                dao.filter(teacher.getSchool_cd());

        // ===== request =====
        request.setAttribute("list", list);

        // ===== forward =====
        request.getRequestDispatcher("class_list.jsp")
               .forward(request, response);
    }
}