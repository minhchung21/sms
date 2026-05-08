package subject;

import java.util.HashMap;
import java.util.Map;

import bean.School;
import bean.Subject;
import bean.Teacher;
import dao.SubjectDAO;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import tool.Action;

public class SubjectCreateExecuteAction extends Action {

    public void execute(HttpServletRequest request, HttpServletResponse response) throws Exception {

        // ===== セッション取得 =====
        HttpSession session = request.getSession(false);

        // ログインしていない場合はログイン画面へ
        if (session == null || session.getAttribute("teacher") == null) {
            response.sendRedirect("../auth/Login.action");
            return;
        }

        // セッションから教師情報を取得
        Teacher teacher = (Teacher) session.getAttribute("teacher");

        // ===== パラメータ取得 =====
        String cd = request.getParameter("cd");       // 科目コード
        String name = request.getParameter("name");   // 科目名

        // エラーメッセージ格納用
        Map<String, String> errors = new HashMap<>();
        
        SubjectDAO dao = new SubjectDAO();

        // ===== 入力チェック =====
        if (cd == null || cd.isEmpty()) {
            errors.put("cd", "科目コードを入力してください");

        } else if (cd.length() != 3) {
            errors.put("cd", "科目コードは3文字で入力してください");
            
        } else if (dao.exists(cd, teacher.getSchool_cd())) {
            errors.put("cd", "科目コードが重複しています");
        }

        // name
        if (name == null || name.isEmpty()) {
            errors.put("name", "科目名を入力してください");

        } else if (name.length() > 20) {
            errors.put("name", "科目名は20文字以内で入力してください");

        } else if (dao.existsName(name, teacher.getSchool_cd())) {
            errors.put("name", "科目名が重複しています");
        }
        // ===== エラーがある場合 =====
        if (!errors.isEmpty()) {

            // 入力値を保持
            request.setAttribute("errors", errors);
            request.setAttribute("cd", cd);
            request.setAttribute("name", name);

            // 登録画面に戻る
            request.getRequestDispatcher("SubjectCreate.action")
                   .forward(request, response);
            return;
        }

        // ===== 登録処理 =====
        Subject subject = new Subject();
        // 学校情報をセット
        School school = new School();
        school.setCd(teacher.getSchool_cd());
        subject.setSchool(school);
        
     // 科目情報セット
        subject.setCd(cd);
        subject.setName(name);
        
        // ===== DB登録 =====
        dao.insert(subject);

        // ===== 完了画面へ =====
        request.getRequestDispatcher("subject_create_done.jsp")
               .forward(request, response);
    }
}