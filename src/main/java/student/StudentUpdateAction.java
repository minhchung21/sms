package student;

import java.util.List;

import bean.Student;
import bean.Teacher;
import dao.ClassNumDAO;
import dao.StudentDAO;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import tool.Action;

public class StudentUpdateAction extends Action {

    public void execute(HttpServletRequest request, HttpServletResponse response) throws Exception {

        // ===== セッションチェック =====
        HttpSession session = request.getSession(false);
        if (session == null || session.getAttribute("teacher") == null) {
            response.sendRedirect("../auth/Login.action");
            return;
        }

        // ===== パラメータ取得 =====
        String no = request.getParameter("no");

        // noがない場合
        if (no == null || no.isEmpty()) {
            response.sendRedirect("StudentList.action");
            return;
        }

        // ===== DB取得 =====
        StudentDAO dao = new StudentDAO();
        ClassNumDAO classDAO = new ClassNumDAO();
        Teacher teacher = (Teacher) session.getAttribute("teacher");
        
        Student student = dao.findByNo(no);

        // データが存在しない場合
        if (student == null) {
            response.sendRedirect("StudentList.action");
            return;
        }
        List<String> classList = classDAO.filter(teacher.getSchool_cd());


        // JSPへ
        request.setAttribute("student", student);
        request.setAttribute("classList", classList);

        request.getRequestDispatcher("/student/student_update.jsp")
               .forward(request, response);
    }
}