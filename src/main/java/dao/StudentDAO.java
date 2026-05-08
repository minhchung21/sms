package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import bean.School;
import bean.Student;

public class StudentDAO extends DAO {

    // ===== 検索 =====
    public List<Student> search(String schoolCd, String f1, String f2, String f3) throws Exception {

        List<Student> list = new ArrayList<>();

        Connection con = getConnection();

        String sql = "SELECT * FROM student WHERE school_cd = ?";

        if (f1 != null && !f1.equals("0")) {
            sql += " AND ent_year = ?";
        }

        if (f2 != null && !f2.equals("0")) {
            sql += " AND class_num = ?";
        }

        if (f3 != null) {
            sql += " AND is_attend = true";
        }

        sql += " ORDER BY no ASC";

        PreparedStatement st = con.prepareStatement(sql);

        int index = 1;
        st.setString(index++, schoolCd);

        if (f1 != null && !f1.equals("0")) {
            st.setInt(index++, Integer.parseInt(f1));
        }

        if (f2 != null && !f2.equals("0")) {
            st.setString(index++, f2);
        }

        ResultSet rs = st.executeQuery();

        while (rs.next()) {
            list.add(createStudent(rs));
        }

        rs.close();
        st.close();
        con.close();

        return list;
    }

    // ===== 学生番号検索 =====
    public Student findByNo(String no) throws Exception {

        Connection con = getConnection();

        PreparedStatement st = con.prepareStatement(
            "SELECT * FROM student WHERE no = ?"
        );

        st.setString(1, no);

        ResultSet rs = st.executeQuery();

        Student student = null;

        if (rs.next()) {
            student = createStudent(rs);
        }

        rs.close();
        st.close();
        con.close();

        return student;
    }

    // ===== 登録 =====
    public void insert(Student student) throws Exception {

        Connection con = getConnection();

        PreparedStatement st = con.prepareStatement(
            "INSERT INTO student VALUES (?, ?, ?, ?, ?, ?)"
        );

        st.setString(1, student.getNo());
        st.setString(2, student.getName());
        st.setInt(3, student.getEntYear());
        st.setString(4, student.getClassNum());
        st.setBoolean(5, student.isAttend());
        st.setString(6, student.getSchool().getCd());

        st.executeUpdate();

        st.close();
        con.close();
    }

    // ===== 入学年度一覧 =====
    public List<Integer> getEntYears(String schoolCd) throws Exception {

        List<Integer> list = new ArrayList<>();

        Connection con = getConnection();

        PreparedStatement st = con.prepareStatement(
            "SELECT DISTINCT ent_year FROM student WHERE school_cd = ? ORDER BY ent_year"
        );

        st.setString(1, schoolCd);

        ResultSet rs = st.executeQuery();

        while (rs.next()) {
            list.add(rs.getInt("ent_year"));
        }

        rs.close();
        st.close();
        con.close();

        return list;
    }

    // ===== クラス一覧 =====
    public List<String> getClassNums(String schoolCd) throws Exception {

        List<String> list = new ArrayList<>();

        Connection con = getConnection();

        PreparedStatement st = con.prepareStatement(
            "SELECT DISTINCT class_num FROM student WHERE school_cd = ? ORDER BY class_num"
        );

        st.setString(1, schoolCd);

        ResultSet rs = st.executeQuery();

        while (rs.next()) {
            list.add(rs.getString("class_num"));
        }

        rs.close();
        st.close();
        con.close();

        return list;
    }

    // ===== 共通変換 =====
    private Student createStudent(ResultSet rs) throws Exception {

        Student s = new Student();

        s.setNo(rs.getString("no"));
        s.setName(rs.getString("name"));
        s.setEntYear(rs.getInt("ent_year"));
        s.setClassNum(rs.getString("class_num"));
        s.setAttend(rs.getBoolean("is_attend"));

        School school = new School();
        school.setCd(rs.getString("school_cd"));

        s.setSchool(school);

        return s;
    }
 // ===== 更新処理 =====
    public void update(Student student) throws Exception {

        // DB接続
        Connection con = getConnection();

        // SQL（更新）
        String sql = "UPDATE student SET " +
                     "name = ?, ent_year = ?, class_num = ?, is_attend = ? " +
                     "WHERE no = ?";

        PreparedStatement st = con.prepareStatement(sql);

        // 値をセット
        st.setString(1, student.getName());       // 名前
        st.setInt(2, student.getEntYear());       // 入学年度
        st.setString(3, student.getClassNum());   // クラス
        st.setBoolean(4, student.isAttend());     // 在学フラグ
        st.setString(5, student.getNo());         // 学生番号（条件）

        // 実行
        st.executeUpdate();

        // クローズ
        st.close();
        con.close();
    }
}