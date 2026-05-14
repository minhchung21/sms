package test;

import java.time.LocalDate;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import bean.Student;
import bean.Subject;
import bean.Teacher;
import bean.TestListStudent;
import dao.ClassNumDAO;
import dao.StudentDAO;
import dao.SubjectDAO;
import dao.TestListStudentDAO;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import tool.Action;

public class TestListStudentExecuteAction extends Action {

    @Override
    public void execute(HttpServletRequest request, HttpServletResponse response)
    	throws Exception {

    	// セッション取得
        HttpSession session = request.getSession(false);

        // ログインしていない場合
        if (session == null || session.getAttribute("teacher") == null) {

            response.sendRedirect(
                    "../auth/Login.action"
            );
            return;
        }

        // ログイン中の先生情報
        Teacher teacher = (Teacher) session.getAttribute("teacher");



     // 検索条件取得
        String studentNo = request.getParameter("f4");



        // DAO
        StudentDAO studentDao = new StudentDAO();

        TestListStudentDAO testDao = new TestListStudentDAO();

        SubjectDAO subjectDao = new SubjectDAO();

        ClassNumDAO classDao = new ClassNumDAO();



        // エラー用
        Map<String,String> errors = new HashMap<>();



        // 学生取得
        Student student = studentDao.findByNo(studentNo);

        // 成績一覧
        List<TestListStudent> tlslist = new ArrayList<>();



        // 学生なし
        if (student == null) {

            errors.put("student","学生情報が存在しませんでした");
        } else {

            // 成績検索
            tlslist = testDao.filter(student);
            
            // 成績なし
            if (tlslist.isEmpty()) {
            	errors.put("student","成績情報が存在しませんでした");
            }
        }



        // クラス一覧
        List<String> cNumlist =
                classDao.filter(
                        teacher.getSchool_cd()
                );

        // 科目一覧
        List<Subject> list =
                subjectDao.findBySchool(
                        teacher.getSchool_cd()
                );



        // 年度リスト
        LocalDate today = LocalDate.now();

        int year = today.getYear();

        List<Integer> entYearSet = new ArrayList<>();

        for (int i = year - 10; i <= year + 10;i++) 
        {
        	entYearSet.add(i);
        }



        // jspへ値を渡す
        request.setAttribute("errors",errors);

        request.setAttribute("student",student);

        request.setAttribute("tlslist",tlslist);

        request.setAttribute("f4",studentNo);

        request.setAttribute("cNumlist",cNumlist);

        request.setAttribute("subjectlist",list);

        request.setAttribute("entYearSet",entYearSet);



        // エラー有無で画面切替
        if (errors.isEmpty()) {

            request.getRequestDispatcher(
                    "test_list_student.jsp"
            ).forward(request, response);

        } else {

            request.getRequestDispatcher(
                    "test_list.jsp"
            ).forward(request, response);
        }
    }
}

