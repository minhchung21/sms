package test;

import java.time.LocalDate;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import bean.School;
import bean.Student;
import bean.Subject;
import bean.Teacher;
import bean.Test;
import dao.ClassNumDAO;
import dao.StudentDAO;
import dao.SubjectDAO;
import dao.TestDAO;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import tool.Action;

public class TestRegistExecuteAction extends Action {

    @Override
    public void execute(HttpServletRequest request, HttpServletResponse response) throws Exception {

        // ===== セッション取得（ログイン確認）=====
        HttpSession session = request.getSession(false);

        // ログインしていない場合はログイン画面へ
        if (session == null || session.getAttribute("teacher") == null) {
            response.sendRedirect(request.getContextPath() + "/auth/Login.action");
            return;
        }

        // ログイン中の教員情報を取得
        Teacher teacher = (Teacher) session.getAttribute("teacher");

        // ===== 学校情報の設定 =====
        School school = new School();
        school.setCd(teacher.getSchool_cd());

        // ===== リクエストパラメータ取得 =====
        String subjectCd = request.getParameter("f3"); // 科目コード
        int f1 = parseIntSafe(request.getParameter("f1")); // 入学年度
        int f4 = parseIntSafe(request.getParameter("f4")); // 回数
        String f2 = request.getParameter("f2"); // クラス番号

        // ===== DAOの準備 =====
        SubjectDAO subjectDao = new SubjectDAO();
        StudentDAO studentDao = new StudentDAO();
        TestDAO testDao = new TestDAO();
        ClassNumDAO classDao = new ClassNumDAO();

        // ===== 科目情報取得 =====
        Subject subject = null;

        if (subjectCd != null && !subjectCd.isEmpty()) {
            // 科目コードから科目情報を取得
            subject = subjectDao.findByCd(subjectCd);
        }

        // 科目未選択チェック
        if (subject == null) {
            request.setAttribute("error", "科目を選択してください");
            request.getRequestDispatcher("test_regist.jsp").forward(request, response);
            return;
        }

        // ===== 学生番号リスト取得 =====
        String[] studentNos = request.getParameterValues("regist");

        // エラーメッセージ格納用Map
        Map<Integer, String> errors = new HashMap<>();

        // 登録用リスト
        List<Test> saveList = new ArrayList<>();

        int index = 1;

        // ===== 点数チェック処理 =====
        if (studentNos != null) {

            for (String no : studentNos) {

                try {
                    // 点数取得
                    String pointStr = request.getParameter("point_" + no);

                    // 数値変換
                    int point = Integer.parseInt(pointStr);

                    // 点数の範囲チェック
                    if (point < 0 || point > 100) {
                        throw new Exception();
                    }

                    // 学生情報取得
                    Student student = studentDao.findByNo(no);

                    // Testオブジェクト作成
                    Test test = new Test();
                    test.setStudent(student);
                    test.setClassNum(student.getClassNum());
                    test.setSubject(subject);
                    test.setSchool(school);
                    test.setNo(f4);
                    test.setPoint(point);

                    // リストに追加
                    saveList.add(test);

                } catch (Exception e) {
                    // エラー時メッセージ設定
                    errors.put(index, "0～100の範囲で入力してください");
                }

                index++;
            }
        }

        // ===== 正常処理（登録）=====
        if (errors.isEmpty()) {

            // データベースに保存
            testDao.save(saveList);

            // 完了画面へ遷移
            request.getRequestDispatcher("test_regist_done.jsp").forward(request, response);
            return;
        }

        // ===== エラー時再表示用データ取得 =====

        // クラス一覧取得
        List<String> cNumList = classDao.filter(teacher.getSchool_cd());

        // 科目一覧取得
        List<Subject> subjectList = subjectDao.findBySchool(teacher.getSchool_cd());

        // 現在年取得
        int year = LocalDate.now().getYear();

        // 入学年度リスト作成（前後10年）
        List<Integer> entYearSet = new ArrayList<>();
        for (int i = year - 10; i <= year + 10; i++) {
            entYearSet.add(i);
        }

        // 回数リスト
        List<Integer> countSet = List.of(1, 2);

        // 検索結果再取得
        List<Test> testList = testDao.filter(f1, f2, subject, f4, school);

        // ===== JSPへデータ送信 =====
        request.setAttribute("errors", errors);
        request.setAttribute("testList", testList);
        request.setAttribute("subjectName", subject.getName());

        request.setAttribute("f1", f1);
        request.setAttribute("f2", f2);
        request.setAttribute("f3", subjectCd);
        request.setAttribute("f4", f4);

        request.setAttribute("entYearSet", entYearSet);
        request.setAttribute("cNumList", cNumList);
        request.setAttribute("subjectList", subjectList);
        request.setAttribute("countSet", countSet);

        // 再表示
        request.getRequestDispatcher("test_regist.jsp").forward(request, response);
    }

    // ===== 安全な数値変換 =====
    private int parseIntSafe(String v) {
        try {
            if (v == null || v.isEmpty()) return 0;
            return Integer.parseInt(v);
        } catch (Exception e) {
            return 0;
        }
    }
}