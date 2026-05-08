package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import bean.Student;
import bean.TestListStudent;

public class TestListStudentDAO extends DAO {

    // ベースSQL
    private String baseSql =
        "select * from test where student_no = ? and school_cd = ?";

    // ResultSet → List<TestListStudent>
    public List<TestListStudent> postFilter(ResultSet rs) throws Exception {
        List<TestListStudent> list = new ArrayList<>();

        while (rs.next()) {
            TestListStudent test = new TestListStudent();
            test.setSubjectCd(rs.getString("subject_cd"));
            test.setSubjectName(rs.getString("subject_name"));
            test.setNum(rs.getInt("no"));
            test.setPoint(rs.getInt("point"));
            list.add(test);
        }
        return list;
    }

    // 学生をもとにテスト一覧を取得
    public List<TestListStudent> filter(Student student) throws Exception {
        List<TestListStudent> list;

        Connection con = getConnection();
        PreparedStatement st =
            con.prepareStatement(baseSql);

        // バインド
        st.setString(1, student.getNo());
        st.setString(2, student.getSchool());

        // SQL実行
        ResultSet rs = st.executeQuery();

        // 共通処理に委譲
        list = postFilter(rs);

        st.close();
        con.close();

        return list;
    }
}