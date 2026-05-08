package subject;

import java.util.List;

import bean.Subject;
import bean.Teacher;
import dao.SubjectDAO;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import tool.Action;

public class SubjectListAction extends Action {

    public void execute(HttpServletRequest request, HttpServletResponse response) throws Exception {

        // ===== セッション取得 =====
        HttpSession session = request.getSession(false);

        // ログインチェック
        if (session == null || session.getAttribute("teacher") == null) {
            response.sendRedirect("../auth/Login.action");
            return;
        }

        // teacher取得
        Teacher teacher = (Teacher) session.getAttribute("teacher");

        // DAO作成
        SubjectDAO dao = new SubjectDAO();

        // 科目一覧取得（学校ごと）
        List<Subject> list = dao.findBySchool(teacher.getSchool_cd());

        // JSPに渡す
        request.setAttribute("subjects", list);

        // 画面遷移
        request.getRequestDispatcher("/subject/subject_list.jsp")
               .forward(request, response);
    }
}