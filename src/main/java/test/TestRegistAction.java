package test;

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
import dao.StudentDAO;
import dao.SubjectDAO;
import dao.TestDAO;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import tool.Action;

public class TestRegistAction extends Action {

    @Override
    public void execute(
            HttpServletRequest request,
            HttpServletResponse response
    ) throws Exception {

        // セッション取得
        HttpSession session =
                request.getSession(false);

        // ログイン確認
        if (session == null ||
            session.getAttribute("teacher") == null) {

            response.sendRedirect(
                    "../auth/Login.action"
            );

            return;
        }

        // ログイン中の先生
        Teacher teacher =
                (Teacher) session.getAttribute("teacher");

        // 学校情報
        SchoolDAO schoolDao =
                new SchoolDAO();

        School school =
                schoolDao.get(
                        teacher.getSchool_cd()
                );



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
        ClassNumDAO classDao =
                new ClassNumDAO();

        SubjectDAO subjectDao =
                new SubjectDAO();

        TestDAO testDao =
                new TestDAO();
        
        StudentDAO studentDAO =
        		new StudentDAO();



        // エラー保存用
        Map<String, String> errors =
                new HashMap<>();



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
        List<Integer> entYearSet =
                studentDAO.getEntYears(
                        teacher.getSchool_cd()
                );



        // 回数一覧
        List<Integer> countSet =
                new ArrayList<>();

        for (int i = 1; i <= 2; i++) {

            countSet.add(i);
        }



        // 成績一覧
        List<Test> testList =
                new ArrayList<>();



        // 検索ボタン押下時
        if (request.getParameter("search") != null) {

            // 未選択チェック
            if (f1 == null || f1.equals("0") ||
                f2 == null || f2.equals("0") ||
                f3 == null || f3.equals("0") ||
                f4 == null || f4.equals("0")) {

                errors.put(
                        "1",
                        "入学年度・クラス・科目・回数を選択してください"
                );

            } else {

                // 型変換
                int entYear =
                        Integer.parseInt(f1);

                int count =
                        Integer.parseInt(f4);



                // 科目取得
                Subject subject =
                        subjectDao.findByCd(f3);



                // 科目が存在しない場合
                if (subject == null) {

                    errors.put(
                            "1",
                            "科目情報が存在しません"
                    );

                } else {

                    // 成績検索
                    testList =
                            testDao.filter(
                                    entYear,
                                    f2,
                                    subject,
                                    count,
                                    school
                            );



                    // 科目名表示用
                    request.setAttribute(
                            "subjectName",
                            subject.getName()
                    );



                    // データなし
                    if (testList.isEmpty()) {

                        errors.put(
                                "1",
                                "成績情報が存在しませんでした"
                        );
                    }
                }
            }
        }



        // JSPへ値を渡す
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



        // JSP表示
        request.getRequestDispatcher(
                "test_regist.jsp"
        ).forward(request, response);
    }
}
