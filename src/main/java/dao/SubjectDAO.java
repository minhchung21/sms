package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import bean.Subject;

public class SubjectDAO extends DAO {

    // ===== 学校ごとの科目一覧取得 =====
    public List<Subject> findBySchool(String schoolCd) throws Exception {

        // リスト作成
        List<Subject> list = new ArrayList<>();

        // DB接続
        Connection con = getConnection();

        // SQL（学校コードで絞り込み）
        String sql = "SELECT * FROM subject WHERE school_cd = ? ORDER BY cd";

        // SQL準備
        PreparedStatement st = con.prepareStatement(sql);

        // パラメータ設定
        st.setString(1, schoolCd);

        // 実行
        ResultSet rs = st.executeQuery();

        while (rs.next()) {
           list.add(createSubject(rs));
        }
        
        rs.close();
        st.close();
        con.close();

        // 結果返却
        return list;
    }
    
    // ===== 科目コード検索 =====
    public Subject findByCd(String cd) throws Exception {

        Connection con = getConnection();

        String sql = "SELECT * FROM subject WHERE cd = ?";
        PreparedStatement st = con.prepareStatement(sql);
        st.setString(1, cd);

        ResultSet rs = st.executeQuery();

        Subject subject = null;

        if (rs.next()) {
            subject = createSubject(rs);
        }

        rs.close();
        st.close();
        con.close();

        return subject;
    }
    
    // 科目登録
    public void insert(Subject subject) throws Exception {
    	
    	Connection con = getConnection();
    	
    	String sql = "INSERT INTO subject (school_cd, cd, name) VALUES (?,?,?)";
    	PreparedStatement st = con.prepareStatement(sql);
    	
    	st.setString(1, subject.getSchool_cd());
    	st.setString(2, subject.getCd());
    	st.setString(3, subject.getName());
    	
    	st.executeUpdate();
    	
    	st.close();
    	con.close();
    	
    }
    
    // 科目更新
    public void update(Subject subject) throws Exception {

        Connection con = getConnection();

        String sql = "UPDATE subject SET name = ? WHERE cd = ?";
        PreparedStatement st = con.prepareStatement(sql);

        st.setString(1, subject.getName());
        st.setString(2, subject.getCd());

        st.executeUpdate();

        st.close();
        con.close();
    }

    // ===== 科目コード重複チェック =====
    public boolean exists(String cd, String schoolCd) throws Exception {

        Connection con = getConnection();

        String sql = "SELECT COUNT(*) FROM subject WHERE cd = ? AND school_cd = ?";
        PreparedStatement st = con.prepareStatement(sql);

        st.setString(1, cd);
        st.setString(2, schoolCd);

        ResultSet rs = st.executeQuery();

        boolean exists = false;

        if (rs.next()) {
            exists = rs.getInt(1) > 0;
        }

        rs.close();
        st.close();
        con.close();

        return exists;
    }
    
 // ===== 科目名重複チェック =====
    public boolean existsName(String name, String schoolCd) throws Exception {

        Connection con = getConnection();

        String sql = "SELECT COUNT(*) FROM subject WHERE name = ? AND school_cd = ?";
        PreparedStatement st = con.prepareStatement(sql);

        st.setString(1, name);
        st.setString(2, schoolCd);

        ResultSet rs = st.executeQuery();

        boolean exists = false;

        if (rs.next()) {
            exists = rs.getInt(1) > 0;
        }

        rs.close();
        st.close();
        con.close();

        return exists;
    }

    // ===== 共通変換 =====
    private Subject createSubject(ResultSet rs) throws Exception {

        Subject s = new Subject();

        s.setCd(rs.getString("cd"));
        s.setName(rs.getString("name"));

        s.setSchool_cd(
                rs.getString("school_cd")
        );

        return s;
    }
    
    // === 削除 ===
    public void delete(String cd) throws Exception {

        Connection con = getConnection();

        String sql = "DELETE FROM subject WHERE cd = ?";
        PreparedStatement st = con.prepareStatement(sql);

        st.setString(1, cd);

        st.executeUpdate();

        st.close();
        con.close();
    }
}