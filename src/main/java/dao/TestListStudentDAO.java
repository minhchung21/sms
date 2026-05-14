package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import bean.Student;
import bean.TestListStudent;

public class TestListStudentDAO extends DAO {

    public List<TestListStudent> filter(
            Student student
    ) throws Exception {

        List<TestListStudent> list =
                new ArrayList<>();

        Connection con =
                getConnection();

        PreparedStatement st =
                null;

        try {

            st = con.prepareStatement(

                "select " +
                "subject.name, " +
                "test.subject_cd, " +
                "test.no, " +
                "test.point " +

                "from test " +

                "join subject " +
                "on test.subject_cd = subject.cd " +

                "where test.student_no=? " +

                "order by test.subject_cd, test.no"

            );



            st.setString(
                    1,
                    student.getNo()
            );



            ResultSet rs =
                    st.executeQuery();



            while (rs.next()) {

                TestListStudent t =
                        new TestListStudent();



                t.setSubjectName(
                        rs.getString("name")
                );

                t.setSubjectCd(
                        rs.getString("subject_cd")
                );

                t.setNum(
                        rs.getInt("no")
                );

                t.setPoint(
                        rs.getInt("point")
                );



                list.add(t);
            }

        } finally {

            if (st != null) {

                st.close();
            }

            if (con != null) {

                con.close();
            }
        }

        return list;
    }
}

