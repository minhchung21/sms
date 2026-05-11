package classnum;

import java.util.HashMap;
import java.util.Map;

import bean.ClassNum;
import bean.Teacher;
import dao.ClassNumDAO;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import tool.Action;

public class ClassUpdateExecuteAction extends Action {

    @Override
    public void execute(HttpServletRequest request, HttpServletResponse response) throws Exception {

        // ===== session check =====
        HttpSession session = request.getSession(false);

        if (session == null || session.getAttribute("teacher") == null) {
            response.sendRedirect("../auth/Login.action");
            return;
        }

        request.setCharacterEncoding("UTF-8");

        Teacher teacher = (Teacher) session.getAttribute("teacher");

        // ===== params =====
        String oldClassNum = request.getParameter("old_class_num");
        String newClassNum = request.getParameter("class_num");

        if (newClassNum != null) {
            newClassNum = newClassNum.trim();
        }

        Map<String, String> errors = new HashMap<>();

        // ===== validate =====
        if (newClassNum == null || newClassNum.isEmpty()) {
            errors.put("class_num", "クラス番号を入力してください");
        }

        ClassNumDAO dao = new ClassNumDAO();

        // ===== duplicate check =====
        if (errors.isEmpty()) {

            ClassNum check = dao.get(newClassNum, teacher.getSchool_cd());

            if (check != null && !oldClassNum.equals(newClassNum)) {
                errors.put("class_num", "クラス番号が重複しています");
            }
        }

        // ===== error =====
        if (!errors.isEmpty()) {

            ClassNum c = new ClassNum();
            c.setClass_num(oldClassNum);
            c.setSchool_cd(teacher.getSchool_cd());

            request.setAttribute("errors", errors);
            request.setAttribute("classNum", c);

            request.getRequestDispatcher("class_update.jsp")
                   .forward(request, response);
            return;
        }

        // ===== update =====
        boolean result = dao.update(
                oldClassNum,
                newClassNum,
                teacher.getSchool_cd()
        );

        // ===== done =====
        request.setAttribute("class_num", newClassNum);

        request.getRequestDispatcher("class_update_done.jsp")
               .forward(request, response);
    }
}