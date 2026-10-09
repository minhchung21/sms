package attendance;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import bean.Student;
import bean.Subject;
import bean.Teacher;
import dao.ClassNumDAO;
import dao.StudentDAO;
import dao.SubjectDAO;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import tool.Action;

public class AttendanceListAction extends Action {

    @Override
    public void execute(
            HttpServletRequest request,
            HttpServletResponse response
    ) throws Exception {

        // ===== セッション取得 =====
        HttpSession session =
                request.getSession(false);

        // ===== ログイン確認 =====
        if (session == null ||
            session.getAttribute("teacher") == null) {

            response.sendRedirect(
                    "../auth/Login.action"
            );

            return;
        }

        // ===== ログイン中の先生 =====
        Teacher teacher =
                (Teacher) session.getAttribute("teacher");



        // ===== パラメータ =====
        String f1 =
                request.getParameter("f1");

        String f2 =
                request.getParameter("f2");

        String f3 =
                request.getParameter("f3");

        String f4 =
                request.getParameter("f4");



        // ===== DAO =====
        StudentDAO studentDao =
                new StudentDAO();

        SubjectDAO subjectDao =
                new SubjectDAO();

        ClassNumDAO classDao =
                new ClassNumDAO();



        // ===== エラー =====
        Map<String, String> errors =
                new HashMap<>();



        // ===== クラス一覧 =====
        List<String> cNumList =
                classDao.filter(
                        teacher.getSchool_cd()
                );



        // ===== 科目一覧 =====
        List<Subject> subjectList =
                subjectDao.findBySchool(
                        teacher.getSchool_cd()
                );



        // ===== 入学年度一覧 =====
        List<Integer> entYearSet =
                studentDao.getEntYears(
                        teacher.getSchool_cd()
                );



        // ===== 学生一覧 =====
        List<Student> studentList =
                new ArrayList<>();



        // ===== 検索ボタン押下 =====
        if (request.getParameter("search")
                != null) {

            // ===== 未入力チェック =====
            if (f1 == null || f1.equals("0") ||
                f2 == null || f2.equals("0") ||
                f3 == null || f3.equals("0")) {

                errors.put(
                        "1",
                        "入学年度・クラス・科目を選択してください"
                );

            } else {

                // ===== 学生検索 =====
                studentList =
                        studentDao.search(
                                teacher.getSchool_cd(),
                                f1,
                                f2,
                                "true"
                        );

                // ===== データなし =====
                if (studentList.isEmpty()) {

                    errors.put(
                            "1",
                            "学生情報が存在しませんでした"
                    );
                }
            }
        }



        // ===== 日付初期値 =====
        if (f4 == null) {

            f4 = "";

        }



        // ===== JSPへ渡す =====
        request.setAttribute(
                "errors",
                errors
        );

        request.setAttribute(
                "studentList",
                studentList
        );

        request.setAttribute(
                "subjectList",
                subjectList
        );

        request.setAttribute(
                "entYearSet",
                entYearSet
        );

        request.setAttribute(
                "cNumList",
                cNumList
        );

        request.setAttribute(
                "f1",
                f1
        );

        request.setAttribute(
                "f2",
                f2
        );

        request.setAttribute(
                "f3",
                f3
        );

        request.setAttribute(
                "f4",
                f4
        );



        // ===== JSP表示 =====
        request.getRequestDispatcher(
                "attendance_list.jsp"
        ).forward(request, response);
    }
}