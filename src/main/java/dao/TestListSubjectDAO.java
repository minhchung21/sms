package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import bean.Subject;
import bean.TestListSubject;

public class TestListSubjectDAO extends DAO {

    // ===== 科目別成績検索 =====
    public List<TestListSubject> filter(
            int entYear,
            String classNum,
            Subject subject,
            String school_cd
    ) throws Exception {

        List<TestListSubject> list = new ArrayList<>();

        Connection con = getConnection();
        PreparedStatement st = null;

        try {

            // ===== SQL（学生テーブル基準で結合）=====
        	String sql =
        		    "select " +
        		    "student.ent_year, " +
        		    "student.no, " +
        		    "student.name, " +
        		    "student.class_num, " +
        		    "test.no as test_no, " +
        		    "test.point " +
        		    "from student " +
        		    "left join test " +
        		    "on test.student_no = student.no " +
        		    "and test.subject_cd=? " +
        		    "and test.school_cd=? " +
        		    "where student.ent_year=? " +
        		    "and student.class_num=? " +
        		    "and student.is_attend= TRUE " +
        		    "order by student.no, test.no";

        	System.out.println(sql);
            st = con.prepareStatement(sql);

            // ===== パラメータ設定 =====
            st.setString(1, subject.getCd());
            st.setString(2, school_cd);
            st.setInt(3, entYear);
            st.setString(4, classNum);

            ResultSet rs = st.executeQuery();

            while (rs.next()) {

                String studentNo = rs.getString("no");

                TestListSubject exist = null;

                for (TestListSubject t : list) {
                    if (t.getStudentNo().equals(studentNo)) {
                        exist = t;
                        break;
                    }
                }

                if (exist == null) {

                    exist = new TestListSubject();

                    exist.setEntYear(rs.getInt("ent_year"));
                    exist.setStudentNo(studentNo);
                    exist.setStudentName(rs.getString("name"));
                    exist.setClassNum(rs.getString("class_num"));

                    list.add(exist);
                }

                Integer testNo = (Integer) rs.getObject("test_no");

                if (testNo != null) {

                    exist.putPoint(
                        testNo,
                        rs.getInt("point")
                    );
                }
            }

        } finally {
            if (st != null) st.close();
            if (con != null) con.close();
        }

        return list;
    }
}