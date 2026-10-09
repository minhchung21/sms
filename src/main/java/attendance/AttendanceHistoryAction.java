package attendance;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import bean.Attendance;
import bean.Teacher;
import dao.AttendanceDAO;
import dao.ClassNumDAO;
import dao.SubjectDAO;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import tool.Action;

public class AttendanceHistoryAction extends Action {

    @Override
    public void execute(
        HttpServletRequest request,
        HttpServletResponse response
    ) throws Exception {

        // ===== セッション =====
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

        Teacher teacher =
            (Teacher)session.getAttribute(
                "teacher"
            );



        // ===== パラメータ取得 =====
        String f2 =
            request.getParameter("f2");

        String f3 =
            request.getParameter("f3");

        String f4 =
            request.getParameter("f4");

        String f5 =
            request.getParameter("f5");



        // ===== DAO =====
        ClassNumDAO cNumDao =
            new ClassNumDAO();

        SubjectDAO subjectDao =
            new SubjectDAO();

        AttendanceDAO attendanceDao =
            new AttendanceDAO();



        // ===== 検索条件 =====
        request.setAttribute(
            "cNumList",
            cNumDao.filter(
                teacher.getSchool_cd()
            )
        );

        request.setAttribute(
            "subjectList",
            subjectDao.findBySchool(
                teacher.getSchool_cd()
            )
        );



        // ===== 入力値保持 =====
        request.setAttribute("f2", f2);
        request.setAttribute("f3", f3);
        request.setAttribute("f4", f4);
        request.setAttribute("f5", f5);



        // ===== エラー =====
        Map<String, String> errors =
            new HashMap<>();



        // ===== 検索 =====
        if (request.getParameter("search")
            != null ||

            f5 != null) {

            List<Attendance> list =
                attendanceDao.search(
                    teacher.getSchool_cd(),
                    f2,
                    f3,
                    f4,
                    f5
                );



            // ===== データなし =====
            if (list.size() == 0) {

                errors.put(
                    "1",
                    "出席情報が存在しませんでした。"
                );
            }



            // ===== 一覧 =====
            request.setAttribute(
                "attendanceList",
                list
            );
        }


        // ===== JSP遷移 =====
        request.getRequestDispatcher(
            "attendance_history.jsp"
        ).forward(request, response);

    }

}