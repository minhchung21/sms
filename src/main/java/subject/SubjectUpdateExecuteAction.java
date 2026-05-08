package subject;

import java.util.HashMap;
import java.util.Map;

import bean.Subject;
import dao.SubjectDAO;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import tool.Action;

public class SubjectUpdateExecuteAction extends Action {

    public void execute(HttpServletRequest request, HttpServletResponse response) throws Exception {

        // ===== セッションチェック =====
        HttpSession session = request.getSession(false);
        if (session == null || session.getAttribute("teacher") == null) {
            response.sendRedirect("../auth/Login.action");
            return;
        }

        request.setCharacterEncoding("UTF-8");

        // ===== パラメータ取得 =====
        String cd = request.getParameter("cd");
        String name = request.getParameter("name");

        SubjectDAO dao = new SubjectDAO();

        // ===== 存在チェック =====
        Subject exist = dao.findByCd(cd);
        if (exist == null) {
            request.setAttribute("errorMessage", "科目が存在していません");
            request.getRequestDispatcher("/subject/subject_update.jsp")
                   .forward(request, response);
            return;
        }

        // ===== バリデーション =====
        Map<String, String> errors = new HashMap<>();

        if (name == null || name.isEmpty()) {
            errors.put("name", "このフィールドを入力して下さい");
        }

        // ===== エラー時 =====
        if (!errors.isEmpty()) {

            Subject subject = new Subject();
            subject.setCd(cd);
            subject.setName(name);

            request.setAttribute("errors", errors);
            request.setAttribute("subject", subject);

            request.getRequestDispatcher("/subject/subject_update.jsp")
                   .forward(request, response);
            return;
        }

        // ===== 更新 =====
        Subject subject = new Subject();
        subject.setCd(cd);
        subject.setName(name);

        dao.update(subject);

        // ===== 完了画面 =====
        request.getRequestDispatcher("subject_update_done.jsp")
               .forward(request, response);
    }
}