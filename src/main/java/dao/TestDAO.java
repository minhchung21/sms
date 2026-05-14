package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import bean.School;
import bean.Student;
import bean.Subject;
import bean.Test;

public class TestDAO extends DAO {

    public List<Test> filter(
            int entYear,
            String classNum,
            Subject subject,
            int count,
            School school
    ) throws Exception {

        List<Test> list =
                new ArrayList<>();

        Connection con =
                getConnection();

        PreparedStatement st =
                null;

        try {

        	st = con.prepareStatement(

        		    "select " +
        		    "s.ent_year, " +
        		    "s.no, " +
        		    "s.name, " +
        		    "s.class_num, " +
        		    "t.point " +

        		    "from student s " +

        		    "left join test t " +

        		    "on s.no = t.student_no " +
        		    "and t.subject_cd = ? " +
        		    "and t.no = ? " +

        		    "where s.ent_year = ? " +
        		    "and s.class_num = ? " +
        		    "and s.school_cd = ? " +
        		    "and s.is_attend = true " +

        		    "order by s.no"
        		);



            st.setString(
                    1,
                    subject.getCd()
            );

            st.setInt(
                    2,
                    count
            );

            st.setInt(
                    3,
                    entYear
            );

            st.setString(
                    4,
                    classNum
            );

            st.setString(
                    5,
                    school.getCd()
            );



            ResultSet rs =
                    st.executeQuery();



            while (rs.next()) {

                Test test =
                        new Test();

                Student student =
                        new Student();



                // ===== Student =====

                student.setEntYear(
                        rs.getInt("ent_year")
                );

                student.setNo(
                        rs.getString("no")
                );

                student.setName(
                        rs.getString("name")
                );



                // ===== Test =====

                test.setStudent(student);

                test.setClassNum(
                        rs.getString("class_num")
                );

                test.setSubject(subject);

                test.setSchool(school);

                test.setNo(count);

                test.setPoint(
                        rs.getInt("point")
                );



                list.add(test);
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



    //成績取得
    public Test get(
            Student student,
            Subject subject,
            School school,
            int no
    ) throws Exception {

        Test test = null;

        Connection con =
                getConnection();

        PreparedStatement st =
                null;

        try {

            st = con.prepareStatement(

                "select * from test " +

                "where student_no = ? " +
                "and subject_cd = ? " +
                "and school_cd = ? " +
                "and no = ?"

            );



            st.setString(
                    1,
                    student.getNo()
            );

            st.setString(
                    2,
                    subject.getCd()
            );

            st.setString(
                    3,
                    school.getCd()
            );

            st.setInt(
                    4,
                    no
            );



            ResultSet rs =
                    st.executeQuery();



            if (rs.next()) {

                test = new Test();

                test.setStudent(student);

                test.setSubject(subject);

                test.setSchool(school);

                test.setNo(no);

                test.setPoint(
                        rs.getInt("point")
                );

                test.setClassNum(
                        rs.getString("class_num")
                );
            }

        } finally {

            if (st != null) {

                st.close();
            }

            if (con != null) {

                con.close();
            }
        }

        return test;
    }



    //登録
    
    public boolean save(
            List<Test> list
    ) throws Exception {

        Connection con =
                getConnection();

        PreparedStatement st =
                null;

        int count = 0;

        try {

            for (Test test : list) {

                Test old =
                        get(
                                test.getStudent(),
                                test.getSubject(),
                                test.getSchool(),
                                test.getNo()
                        );



                // 新規登録
                if (old == null) {

                    st = con.prepareStatement(

                        "insert into test " +

                        "(student_no, " +
                        "subject_cd, " +
                        "school_cd, " +
                        "no, " +
                        "point, " +
                        "class_num) " +

                        "values (?, ?, ?, ?, ?, ?)"

                    );



                    st.setString(
                            1,
                            test.getStudent().getNo()
                    );

                    st.setString(
                            2,
                            test.getSubject().getCd()
                    );

                    st.setString(
                            3,
                            test.getSchool().getCd()
                    );

                    st.setInt(
                            4,
                            test.getNo()
                    );

                    st.setInt(
                            5,
                            test.getPoint()
                    );

                    st.setString(
                            6,
                            test.getClassNum()
                    );



                // 更新
                } else {

                    st = con.prepareStatement(

                        "update test " +

                        "set point = ? " +

                        "where student_no = ? " +
                        "and subject_cd = ? " +
                        "and school_cd = ? " +
                        "and no = ?"

                    );



                    st.setInt(
                            1,
                            test.getPoint()
                    );

                    st.setString(
                            2,
                            test.getStudent().getNo()
                    );

                    st.setString(
                            3,
                            test.getSubject().getCd()
                    );

                    st.setString(
                            4,
                            test.getSchool().getCd()
                    );

                    st.setInt(
                            5,
                            test.getNo()
                    );
                }



                count +=
                        st.executeUpdate();

                st.close();
            }

        } finally {

            if (st != null) {

                st.close();
            }

            if (con != null) {

                con.close();
            }
        }

        return count > 0;
    }
}

