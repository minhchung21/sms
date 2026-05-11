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

public class ClassCreateExecuteAction extends Action {

    @Override
    public void execute(HttpServletRequest request, HttpServletResponse response) throws Exception {

        HttpSession session = request.getSession(false);
        Teacher teacher = (Teacher) session.getAttribute("teacher");

        String class_num = request.getParameter("class_num");

        Map<String, String> errors = new HashMap<>();

        ClassNumDAO dao = new ClassNumDAO();

        // ===== validate =====
        if (class_num == null || class_num.trim().isEmpty()) {
            errors.put("class_num", "クラス番号を入力してください");
        }

        // ===== duplicate check =====
        if (errors.isEmpty()) {
            if (dao.get(class_num, teacher.getSchool_cd()) != null) {
                errors.put("class_num", "クラス番号が重複しています");
            }
        }

        // ===== error =====
        if (!errors.isEmpty()) {
            request.setAttribute("errors", errors);
            request.setAttribute("class_num", class_num);

            request.getRequestDispatcher("class_create.jsp")
               .forward(request, response);
            return;
        }

        // ===== save =====
        ClassNum c = new ClassNum();
        c.setClass_num(class_num);
        c.setSchool_cd(teacher.getSchool_cd());

        dao.save(c);

        request.getRequestDispatcher("class_create_done.jsp")
           .forward(request, response);
    }
}