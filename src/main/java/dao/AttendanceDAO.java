package dao;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import bean.Attendance;
import bean.Student;
import bean.Subject;

public class AttendanceDAO extends DAO {

    // ===== 出席登録 =====
    public void insert(Attendance attendance)
    throws Exception {

        Connection con = getConnection();

        String sql =
            "INSERT INTO attendance " +
            "(student_no, subject_cd, " +
            "attendance_date, status, school_cd) " +
            "VALUES (?, ?, ?, ?, ?)";

        PreparedStatement st =
            con.prepareStatement(sql);

        st.setString(
            1,
            attendance.getStudent().getNo()
        );

        st.setString(
            2,
            attendance.getSubject().getCd()
        );

        st.setDate(
            3,
            Date.valueOf(
                attendance.getAttendanceDate()
            )
        );

        st.setString(
            4,
            attendance.getStatus()
        );

        st.setString(
            5,
            attendance.getSchool_cd()
        );

        st.executeUpdate();

        st.close();
        con.close();
    }



    // ===== 出席検索 =====
    public List<Attendance> search(
        String schoolCd,
        String classNum,
        String subjectCd,
        String date,
        String status
    ) throws Exception {

        List<Attendance> list =
            new ArrayList<>();

        Connection con = getConnection();

        String sql =
            "SELECT a.*, " +
            "s.name AS student_name, " +
            "s.class_num, " +
            "sub.name AS subject_name " +
            "FROM attendance a " +

            "INNER JOIN student s " +
            "ON a.student_no = s.no " +

            "INNER JOIN subject sub " +
            "ON a.subject_cd = sub.cd " +

            "WHERE a.school_cd = ?";



        // クラス
        if (classNum != null &&
            !classNum.equals("0")) {

            sql +=
                " AND s.class_num = ?";
        }



        // 科目
        if (subjectCd != null &&
            !subjectCd.equals("0")) {

            sql +=
                " AND a.subject_cd = ?";
        }



        // 日付
        if (date != null &&
            !date.isEmpty()) {

            sql +=
                " AND a.attendance_date = ?";
        }



        // 出席状況
        if (status != null &&
            !status.isEmpty()) {

            sql +=
                " AND a.status = ?";
        }



        sql +=
            " ORDER BY " +
            "a.attendance_date DESC, " +
            "s.class_num ASC";



        PreparedStatement st =
            con.prepareStatement(sql);

        int index = 1;

        st.setString(index++, schoolCd);



        // クラス
        if (classNum != null &&
            !classNum.equals("0")) {

            st.setString(
                index++,
                classNum
            );
        }



        // 科目
        if (subjectCd != null &&
            !subjectCd.equals("0")) {

            st.setString(
                index++,
                subjectCd
            );
        }



        // 日付
        if (date != null &&
            !date.isEmpty()) {

            st.setDate(
                index++,
                Date.valueOf(date)
            );
        }



        // 出席状況
        if (status != null &&
            !status.isEmpty()) {

            st.setString(
                index++,
                status
            );
        }



        ResultSet rs =
            st.executeQuery();

        while (rs.next()) {

            list.add(
                createAttendance(rs)
            );

        }

        rs.close();
        st.close();
        con.close();

        return list;
    }



    // ===== 学生別出席一覧 =====
    public List<Attendance> findByStudent(
        String studentNo
    ) throws Exception {

        List<Attendance> list =
            new ArrayList<>();

        Connection con = getConnection();

        String sql =
            "SELECT a.*, " +
            "sub.name AS subject_name " +

            "FROM attendance a " +

            "INNER JOIN subject sub " +
            "ON a.subject_cd = sub.cd " +

            "WHERE student_no = ? " +

            "ORDER BY attendance_date DESC";

        PreparedStatement st =
            con.prepareStatement(sql);

        st.setString(1, studentNo);

        ResultSet rs =
            st.executeQuery();

        while (rs.next()) {

            list.add(
                createAttendance(rs)
            );

        }

        rs.close();
        st.close();
        con.close();

        return list;
    }



    // ===== 共通変換 =====
    private Attendance createAttendance(
        ResultSet rs
    ) throws Exception {

        Attendance attendance =
            new Attendance();

        attendance.setId(
            rs.getInt("id")
        );



        // ===== Student =====
        Student student =
            new Student();

        student.setNo(
            rs.getString("student_no")
        );

        try {

            student.setName(
                rs.getString("student_name")
            );

        } catch (Exception e) {

        }

        try {

            student.setClassNum(
                rs.getString("class_num")
            );

        } catch (Exception e) {

        }

        attendance.setStudent(student);



        // ===== Subject =====
        Subject subject =
            new Subject();

        subject.setCd(
            rs.getString("subject_cd")
        );

        try {

            subject.setName(
                rs.getString("subject_name")
            );

        } catch (Exception e) {

        }

        attendance.setSubject(subject);



        // ===== その他 =====
        attendance.setAttendanceDate(
            rs.getDate(
                "attendance_date"
            ).toLocalDate()
        );

        attendance.setStatus(
            rs.getString("status")
        );

        attendance.setSchool_cd(
            rs.getString("school_cd")
        );

        return attendance;
    }

}