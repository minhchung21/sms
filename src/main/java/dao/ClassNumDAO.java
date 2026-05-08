package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import bean.ClassNum;
import bean.School;

public class ClassNumDAO extends DAO {
	

	public ClassNum get(String class_num,School school) throws Exception {
		return null;
	}
	
//	public List<String> filter(School school) throws Exception{
//		return null;
//	}
	public List<String> filter(String school_cd) throws Exception{
		// リストを初期化
		List<String> list = new ArrayList<>();
		Connection con=getConnection();
		// プリペアードステートメントにSQL文をセット
		PreparedStatement st = con.prepareStatement("select * from class_num where school_cd=?");
		// プリペアードステートメントに学校コードをバインド
		st.setString(1, school_cd);
		// プリペアードステートメントを実行
		ResultSet resultSet=st.executeQuery();
		// リストへの格納処理を実行
		while (resultSet.next()) {
			// リストに追加
			list.add(resultSet.getString("class_num"));
		}
		st.close();
		con.close();
		return list;
	}

	public boolean save(ClassNum classNum) throws Exception {
		return false;		
	}	
	public boolean save(ClassNum classNum,String newClassNum) throws Exception {
		return false;		
	}	

}
