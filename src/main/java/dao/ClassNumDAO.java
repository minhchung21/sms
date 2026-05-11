package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import bean.ClassNum;

public class ClassNumDAO extends DAO {

    // ===== get =====
    public ClassNum get(String class_num, String school_cd) throws Exception {

        ClassNum c = null;

        Connection con = getConnection();
        PreparedStatement st = null;

        try {

            st = con.prepareStatement(
                "SELECT * FROM class_num WHERE class_num=? AND school_cd=?"
            );

            st.setString(1, class_num);
            st.setString(2, school_cd);

            ResultSet rs = st.executeQuery();

            if (rs.next()) {

                c = new ClassNum();
                c.setClass_num(rs.getString("class_num"));
                c.setSchool_cd(rs.getString("school_cd"));
            }

        } finally {
            if (st != null) st.close();
            if (con != null) con.close();
        }

        return c;
    }

    // ===== list =====
    public List<String> filter(String school_cd) throws Exception {

        List<String> list = new ArrayList<>();

        Connection con = getConnection();
        PreparedStatement st = null;

        try {

            st = con.prepareStatement(
                "SELECT class_num FROM class_num WHERE school_cd=? ORDER BY class_num"
            );

            st.setString(1, school_cd);

            ResultSet rs = st.executeQuery();

            while (rs.next()) {
                list.add(rs.getString("class_num"));
            }

        } finally {
            if (st != null) st.close();
            if (con != null) con.close();
        }

        return list;
    }

    // ===== insert =====
    public boolean save(ClassNum c) throws Exception {

        Connection con = getConnection();
        PreparedStatement st = null;

        int count = 0;

        try {

            st = con.prepareStatement(
                "INSERT INTO class_num (school_cd, class_num) VALUES (?, ?)"
            );

            st.setString(1, c.getSchool_cd());
            st.setString(2, c.getClass_num());

            count = st.executeUpdate();

        } finally {
            if (st != null) st.close();
            if (con != null) con.close();
        }

        return count > 0;
    }
    
    public boolean update(String oldClassNum, String newClassNum, String schoolCd) throws Exception {

        Connection con = getConnection();
        PreparedStatement st = null;

        int count = 0;

        try {

            st = con.prepareStatement(
                "update class_num set class_num=? where class_num=? and school_cd=?"
            );

            st.setString(1, newClassNum);
            st.setString(2, oldClassNum);
            st.setString(3, schoolCd);

            count = st.executeUpdate();

        } finally {
            if (st != null) st.close();
            if (con != null) con.close();
        }

        return count > 0;
    }
}