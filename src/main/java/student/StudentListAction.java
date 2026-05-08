package student;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import bean.Student;
import bean.Teacher;
import dao.StudentDAO;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import tool.Action;

public class StudentListAction extends Action {

    public void execute(HttpServletRequest request, HttpServletResponse response) throws Exception {

        // ===== セッションチェック =====
        HttpSession session = request.getSession(false);

        // 未ログインの場合はログイン画面へ
        if (session == null || session.getAttribute("teacher") == null) {
            response.sendRedirect("../auth/Login.action");
            return;
        }

        // 教師情報取得
        Teacher teacher = (Teacher) session.getAttribute("teacher");

        // DAO生成
        StudentDAO dao = new StudentDAO();

        // ===== パラメータ取得 =====
        String f1 = request.getParameter("f1"); // 入学年度
        String f2 = request.getParameter("f2"); // クラス
        String f3 = request.getParameter("f3"); // 在学フラグ

        // 再表示用
        request.setAttribute("f1", f1);
        request.setAttribute("f2", f2);
        request.setAttribute("f3", f3);

        // ===== エラーチェック =====
        Map<String, String> errors = new HashMap<>();

        // クラス指定時は年度必須
        if ((f1 == null || f1.equals("0")) && (f2 != null && !f2.equals("0"))) {
            errors.put("f1", "クラスを指定する場合は入学年度も必要です");
        }

        request.setAttribute("errors", errors);

        // ===== 検索処理 =====
        List<Student> list;

        if (errors.isEmpty()) {
            list = dao.search(teacher.getSchool_cd(), f1, f2, f3);
        } else {
            list = dao.search(teacher.getSchool_cd(), null, null, f3);
        }

        request.setAttribute("students", list);

        // ===== コンボ用データ =====
        request.setAttribute("ent_year_set", dao.getEntYears(teacher.getSchool_cd()));
        request.setAttribute("class_num_set", dao.getClassNums(teacher.getSchool_cd()));

        // ===== 画面遷移 =====
        request.getRequestDispatcher("/student/student_list.jsp")
               .forward(request, response);
    }
}