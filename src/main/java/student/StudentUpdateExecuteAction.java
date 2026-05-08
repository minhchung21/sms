package student;

import java.util.HashMap;
import java.util.Map;

import bean.Student;
import bean.Teacher;
import dao.ClassNumDAO;
import dao.StudentDAO;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import tool.Action;

public class StudentUpdateExecuteAction extends Action {

    public void execute(HttpServletRequest request, HttpServletResponse response) throws Exception {

        // ===== セッションチェック =====
        HttpSession session = request.getSession(false);
        if (session == null || session.getAttribute("teacher") == null) {
            response.sendRedirect("../auth/Login.action");
            return;
        }
        request.setCharacterEncoding("UTF-8");

        // ===== パラメータ取得 =====
        String no = request.getParameter("no");
        String name = request.getParameter("name");
        String entYearStr = request.getParameter("entYear");
        String classNum = request.getParameter("classNum");

        boolean attend = request.getParameter("attend") != null;

        Map<String, String> errors = new HashMap<>();

        // ===== バリデーション =====
        if (name == null || name.isEmpty()) {
            errors.put("name", "氏名を入力してください");
        }

        int entYear = 0;
        try {
            entYear = Integer.parseInt(entYearStr);
        } catch (Exception e) {
            errors.put("entYear", "入学年度が不正です");
        }

        // ===== エラー時 =====
        if (!errors.isEmpty()) {
            
        	Student student = new Student();
            student.setNo(no);
            student.setName(name);
            student.setEntYear(entYear);
            student.setClassNum(classNum);
            student.setAttend(attend);
            
            request.setAttribute("errors", errors);
            request.setAttribute("student", student);
            
            ClassNumDAO classDAO = new ClassNumDAO();
            Teacher teacher = (Teacher) session.getAttribute("teacher");
            request.setAttribute("classList", classDAO.filter(teacher.getSchool_cd()));
            
            request.getRequestDispatcher("/student/student_update.jsp")
                   .forward(request, response);
            return;
        }

        // ===== 更新 =====
        Student student = new Student();
        student.setNo(no);
        student.setName(name);
        student.setEntYear(entYear);
        student.setClassNum(classNum);
        student.setAttend(attend);

        StudentDAO dao = new StudentDAO();
        dao.update(student);

        request.getRequestDispatcher("student_update_done.jsp")
               .forward(request, response);
    }
}