package test;

import java.time.LocalDate;
import java.util.ArrayList;
import java.util.List;

import bean.Subject;
import bean.Teacher;
import dao.ClassNumDAO;
import dao.SubjectDAO;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import tool.Action;

public class TestListAction extends Action {

    @Override
    public void execute(
            HttpServletRequest req,
            HttpServletResponse res
    ) throws Exception {

        // ===== session check =====
        HttpSession session = req.getSession(false);

        if (session == null ||
            session.getAttribute("teacher") == null) {

            res.sendRedirect("../auth/Login.action");
            return;
        }

        // ===== teacher =====
        Teacher teacher =
                (Teacher) session.getAttribute("teacher");

        String schoolCd =
                teacher.getSchool_cd();

        // ===== DAO =====
        ClassNumDAO classNumDao =
                new ClassNumDAO();

        SubjectDAO subjectDao =
                new SubjectDAO();

        // ===== data =====
        List<String> cNumlist =
                classNumDao.filter(schoolCd);

        List<Subject> list =
                subjectDao.findBySchool(schoolCd);

        // ===== year list =====
        LocalDate today =
                LocalDate.now();

        int year =
                today.getYear();

        List<Integer> entYearSet =
                new ArrayList<>();

        for (int i = year - 10; i <= year + 10; i++) {

            entYearSet.add(i);

        }

        // ===== request =====
        req.setAttribute("cNumlist", cNumlist);

        req.setAttribute("list", list);

        req.setAttribute("entYearSet", entYearSet);

        // ===== forward =====
        req.getRequestDispatcher("test_list.jsp")
           .forward(req, res);
    }
}