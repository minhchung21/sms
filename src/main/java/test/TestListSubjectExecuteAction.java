package test;

import java.time.LocalDate;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import bean.Subject;
import bean.Teacher;
import bean.TestListSubject;
import dao.ClassNumDAO;
import dao.SubjectDAO;
import dao.TestListSubjectDAO;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import tool.Action;

public class TestListSubjectExecuteAction extends Action {

    @Override
    public void execute(
            HttpServletRequest request,
            HttpServletResponse response
    ) throws Exception {
    	System.out.println("SUBJECT ACTION");

        HttpSession session = request.getSession(false);

        if (session == null || session.getAttribute("teacher") == null) {
            response.sendRedirect("../auth/Login.action");
            return;
        }

        Teacher teacher = (Teacher) session.getAttribute("teacher");

        // ===== PARAM SAFE =====
        String entYearStr = request.getParameter("f1");
        String classNum = request.getParameter("f2");
        String subjectCd = request.getParameter("f3");

        int entYear = 0;

        try {
            entYear = Integer.parseInt(entYearStr);
        } catch (Exception e) {
            entYear = 0;
        }

        Map<String, String> errors = new HashMap<>();

        // ===== 未選択チェック =====
        if (entYear == 0 ||
            classNum == null || "0".equals(classNum) ||
            subjectCd == null || "0".equals(subjectCd)) {

            errors.put("subject", "入学年度とクラスと科目を選択してください");
        }

        SubjectDAO subjectDao = new SubjectDAO();
        ClassNumDAO classDao = new ClassNumDAO();
        TestListSubjectDAO testDao = new TestListSubjectDAO();

        Subject subject = null;
        List<TestListSubject> tlslist = new ArrayList<>();

        // ===== 正常処理 =====
        if (errors.isEmpty()) {

            subject = subjectDao.findByCd(subjectCd);

            tlslist = testDao.filter(
                    entYear,
                    classNum,
                    subject,
                    teacher.getSchool_cd()
                    
            );
            System.out.println("SIZE = " + tlslist.size());

            if (tlslist.isEmpty()) {
                errors.put("subject", "学生情報が存在しませんでした");
            } else {
                request.setAttribute("tlslist", tlslist);
                request.setAttribute("subject_name", subject.getName());
            }
        }

        // ===== 共通データ =====
        List<String> cNumlist = classDao.filter(teacher.getSchool_cd());
        List<Subject> list = subjectDao.findBySchool(teacher.getSchool_cd());

        int year = LocalDate.now().getYear();

        List<Integer> entYearSet = new ArrayList<>();
        for (int i = year - 3; i <= year + 3; i++) {
            entYearSet.add(i);
        }

        // ===== JSPへ =====
        request.setAttribute("errors", errors);

        request.setAttribute("f1", entYear);
        request.setAttribute("f2", classNum);
        request.setAttribute("f3", subjectCd);

        request.setAttribute("cNumlist", cNumlist);
        request.setAttribute("list", list);
        request.setAttribute("entYearSet", entYearSet);

        if (errors.isEmpty()) {
            request.getRequestDispatcher("test_list_subject.jsp")
                   .forward(request, response);
        } else {
            request.getRequestDispatcher("test_list.jsp")
                   .forward(request, response);
        }
    }
}