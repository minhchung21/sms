package student;

import java.util.List;

import bean.Teacher;
import dao.ClassNumDAO;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import tool.Action;

public class StudentCreateAction extends Action {

    public void execute(HttpServletRequest request, HttpServletResponse response) throws Exception {

        // ===== セッションチェック =====
        HttpSession session = request.getSession(false);
        if (session == null || session.getAttribute("teacher") == null) {
            response.sendRedirect("../auth/Login.action");
            return;
        }

        Teacher teacher = (Teacher) session.getAttribute("teacher");

        // ===== クラス番号取得 =====
        ClassNumDAO dao = new ClassNumDAO();
        List<String> classnum = dao.filter(teacher.getSchool_cd());

        request.setAttribute("classnum", classnum);

        // ===== 画面表示 =====
        request.getRequestDispatcher("student_create.jsp")
               .forward(request, response);
    }
}