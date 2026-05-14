package student;

import java.util.HashMap;
import java.util.Map;

import bean.Student;
import bean.Teacher;
import dao.StudentDAO;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import tool.Action;

public class StudentCreateExecuteAction extends Action {

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
        String no = request.getParameter("no");           // 学生番号
        String name = request.getParameter("name");       // 氏名
        String entYearStr = request.getParameter("ent_year"); // 入学年度
        String classNum = request.getParameter("class_num");  // クラス番号

        // エラーメッセージ格納用
        Map<String, String> errors = new HashMap<>();

        // ===== 入学年度チェック =====
        int entYear = 0;
        try {
            entYear = Integer.parseInt(entYearStr);
            if (entYear == 0) {
                errors.put("entYear", "入学年度を選択してください");
            }
        } catch (Exception e) {
            errors.put("entYear", "入学年度を選択してください");
        }

        // ===== 重複チェック =====
        StudentDAO dao = new StudentDAO();

        if (no != null && !no.isEmpty()) {

            if (dao.findByNo(no) != null) {

                errors.put("no", "学生番号が重複しています");
            }
        }

        // ===== エラーがある場合 =====
        if (!errors.isEmpty()) {

            // 入力値を保持
            request.setAttribute("errors", errors);
            request.setAttribute("no", no);
            request.setAttribute("name", name);
            request.setAttribute("ent_year", entYear);
            request.setAttribute("class_num", classNum);

            // 登録画面に戻る
            request.getRequestDispatcher("StudentCreate.action")
                   .forward(request, response);
            return;
        }

        // ===== 学生オブジェクト作成 =====
        Student student = new Student();
        student.setNo(no);
        student.setName(name);
        student.setEntYear(entYear);
        student.setClassNum(classNum);
        student.setAttend(true); // 在学中として登録

        // 学校情報をセット
        student.setSchool_cd(
                teacher.getSchool_cd()
        );

        // ===== DB登録 =====
        dao.insert(student);

        // ===== 完了画面へ =====
        request.getRequestDispatcher("student_create_done.jsp")
               .forward(request, response);
    }
}