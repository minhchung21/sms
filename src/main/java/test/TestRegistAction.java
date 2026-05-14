package test;

import java.time.LocalDate;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import bean.School;
import bean.Subject;
import bean.Teacher;
import bean.Test;
import dao.ClassNumDAO;
import dao.SchoolDAO;
import dao.SubjectDAO;
import dao.TestDAO;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import tool.Action;

public class TestRegistAction extends Action {

    @Override
    public void execute(HttpServletRequest request, HttpServletResponse response) 
    	throws Exception {

        // セッション取得
        HttpSession session =request.getSession(false);

        // ログイン確認
        if (session == null ||
            session.getAttribute("teacher") == null) {

            response.sendRedirect(
                    "../auth/Login.action"
            );

            return;
        }

        // ログイン中の先生
        Teacher teacher = (Teacher) session.getAttribute("teacher");



        // 学校情報
        SchoolDAO schoolDao = new SchoolDAO();

        School school = schoolDao.get(teacher.getSchool_cd());



        // 検索条件
        String f1 =
                request.getParameter("f1");

        String f2 =
                request.getParameter("f2");

        String f3 =
                request.getParameter("f3");

        String f4 =
                request.getParameter("f4");



        // DAO
        ClassNumDAO classDao = new ClassNumDAO();

        SubjectDAO subjectDao = new SubjectDAO();

        TestDAO testDao = new TestDAO();



        // エラー
        Map<String,String> errors = new HashMap<>();



        // クラス一覧
        List<String> cNumList =
                classDao.filter(
                        teacher.getSchool_cd()
                );



        // 科目一覧
        List<Subject> subjectList =
                subjectDao.findBySchool(
                        teacher.getSchool_cd()
                );



        // 入学年度一覧
        LocalDate today =
                LocalDate.now();

        int year =
                today.getYear();

        List<Integer> entYearSet =
                new ArrayList<>();

        for (int i = year - 10;i <= year + 10;i++) {

            entYearSet.add(i);
        }



        // 回数一覧
        List<Integer> countSet = new ArrayList<>();

        for (int i = 1;i <= 2;i++) {

            countSet.add(i);
        }



        // 成績一覧
        List<Test> testList =new ArrayList<>();



        // 検索された場合
        if (f1 != null ||
            f2 != null ||
            f3 != null ||
            f4 != null) {

            // 未選択
            if ("0".equals(f1) ||
                "0".equals(f2) ||
                "0".equals(f3) ||
                "0".equals(f4)) {

                errors.put("1", "入学年度・クラス・科目・回数を選択してください");

            } else {

                // 型変換
                int entYear = Integer.parseInt(f1);

                int count = Integer.parseInt(f4);



                // 科目取得
                Subject subject = subjectDao.findByCd(f3);



                // 成績検索
                testList =testDao.filter(entYear, f2,subject, count, school);



                // 科目名
                request.setAttribute("subjectName", subject.getName());



                // データなし
                if (testList.isEmpty()) {

                    errors.put("1","成績情報が存在しませんでした");
                }
            }
        }



        // jspへ値を渡す
        request.setAttribute(
                "errors",
                errors
        );

        request.setAttribute(
                "testList",
                testList
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

        request.setAttribute(
                "entYearSet",
                entYearSet
        );

        request.setAttribute(
                "cNumList",
                cNumList
        );

        request.setAttribute(
                "subjectList",
                subjectList
        );

        request.setAttribute(
                "countSet",
                countSet
        );



        // jspへ
        request.getRequestDispatcher(
                "test_regist.jsp"
        ).forward(request, response);
    }
}

