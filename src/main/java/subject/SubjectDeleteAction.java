package subject;

import bean.Subject;
import dao.SubjectDAO;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import tool.Action;

public class SubjectDeleteAction extends Action {

    public void execute(HttpServletRequest request, HttpServletResponse response) throws Exception {

        // ===== セッションチェック =====
        HttpSession session = request.getSession(false);
        if (session == null || session.getAttribute("teacher") == null) {
            response.sendRedirect("../auth/Login.action");
            return;
        }

        // ===== パラメータ取得 =====
        String cd = request.getParameter("cd");

        // noがない場合
        if (cd == null || cd.isEmpty()) {
            response.sendRedirect("SubjectList.action");
            return;
        }

        // ===== DB取得 =====
        SubjectDAO dao = new SubjectDAO();
        Subject subject = dao.findByCd(cd);

        // データが存在しない場合
        if (subject == null) {
            response.sendRedirect("SubjectList.action");
            return;
        }

        // JSPへ
        request.setAttribute("subject", subject);

        request.getRequestDispatcher("/subject/subject_delete.jsp")
               .forward(request, response);
    }
}