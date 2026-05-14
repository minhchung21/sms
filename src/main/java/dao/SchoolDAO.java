package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import bean.School;

public class SchoolDAO extends DAO {

    //学校情報取得
    public School get(String cd)
            throws Exception {

        School school = null;

        Connection con =
                getConnection();

        PreparedStatement st = null;

        try {

            st = con.prepareStatement(
                    "select * from school where cd=?"
            );

            st.setString(1, cd);

            ResultSet rs =
                    st.executeQuery();

            if (rs.next()) {

                school = new School();

                school.setCd(
                        rs.getString("cd")
                );

                school.setName(
                        rs.getString("name")
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

        return school;
    }
}

