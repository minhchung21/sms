package test;

import java.util.List;

import bean.Subject;
import bean.Teacher;
import dao.ClassNumDAO;
import dao.StudentDAO;
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

        // DAO
        ClassNumDAO classNumDao = new ClassNumDAO();

        SubjectDAO subjectDao = new SubjectDAO();
        
        StudentDAO studentDao = new StudentDAO();

        // data
        List<String> cNumlist =
                classNumDao.filter(schoolCd);

        List<Subject> list =
                subjectDao.findBySchool(schoolCd);

        // 入学年度一覧
        List<Integer> entYearSet =
                studentDao.getEntYears(
                        teacher.getSchool_cd()
                );


        // ===== request =====
        req.setAttribute("cNumlist", cNumlist);

        req.setAttribute("list", list);

        req.setAttribute("entYearSet", entYearSet);

        // ===== forward =====
        req.getRequestDispatcher("test_list.jsp")
           .forward(req, res);
    }
}