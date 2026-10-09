package attendance;

import java.time.LocalDate;

import bean.Attendance;
import bean.Student;
import bean.Subject;
import bean.Teacher;
import dao.AttendanceDAO;
import dao.SubjectDAO;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import tool.Action;

public class AttendanceExecuteAction extends Action {

    @Override
    public void execute(
            HttpServletRequest request,
            HttpServletResponse response
    ) throws Exception {

        // ===== セッション =====
        HttpSession session =
                request.getSession(false);

        if (session == null ||
            session.getAttribute("teacher") == null) {

            response.sendRedirect(
                    "../auth/Login.action"
            );

            return;
        }

        Teacher teacher =
                (Teacher) session.getAttribute("teacher");



        // ===== パラメータ =====
        String[] registList =
                request.getParameterValues(
                        "regist"
                );

        String subjectCd =
                request.getParameter("f3");

        String date =
                request.getParameter("f4");



        // ===== DAO =====
        AttendanceDAO attendanceDao =
                new AttendanceDAO();

        SubjectDAO subjectDao =
                new SubjectDAO();



        // ===== 科目 =====
        Subject subject =
                subjectDao.findByCd(subjectCd);



        // ===== 登録 =====
        for (String no : registList) {

            String status =
                    request.getParameter(
                            "status_" + no
                    );

            Attendance attendance =
                    new Attendance();

            // 学生
            Student student =
                    new Student();

            student.setNo(no);

            attendance.setStudent(student);

            // 科目
            attendance.setSubject(subject);

            // 日付
            attendance.setAttendanceDate(
                    LocalDate.parse(date)
            );

            // 状況
            attendance.setStatus(status);

            // 学校コード
            attendance.setSchool_cd(
                    teacher.getSchool_cd()
            );

            // DB登録
            attendanceDao.insert(attendance);
        }



        // ===== 完了画面 =====
        request.getRequestDispatcher(
                "attendance_done.jsp"
        ).forward(request, response);
    }
}