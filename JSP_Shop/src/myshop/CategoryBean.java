package myshop;

import java.sql.*;
import java.util.ArrayList;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

public class CategoryBean {
	Connection con;
	PreparedStatement ps;
	ResultSet rs;
	
	static DataSource ds;
	static{
		try{
			Context init = new InitialContext();
			ds = (DataSource)init.lookup("java:comp/env/jdbc/oracle");
		}catch(NamingException e){
			System.out.println("lookup½ÇÆÐ : " + e.getMessage());
		}
	}
	
	public int insert(CategoryDTO dto) throws SQLException {
		String sql = "insert into category values(cate_seq.nextval,?,?)";
		try{
			con = ds.getConnection();
			ps = con.prepareStatement(sql);
			ps.setString(1, dto.getCode());
			ps.setString(2, dto.getCname());
			int res = ps.executeUpdate();
			return res;
		}finally{
			if (ps != null) ps.close();
			if (con != null) con.close();
		}
	}
	
	public CategoryDTO[] list() throws SQLException{
		String sql = "select * from category";
		ArrayList al = new ArrayList();
		try{
			con = ds.getConnection();
			ps = con.prepareStatement(sql);
			rs = ps.executeQuery();
			while(rs.next()){
				String cnum = rs.getString(1);
				String code = rs.getString(2);
				String cname = rs.getString(3);
				CategoryDTO dto = new CategoryDTO(cnum, code, cname);
				al.add(dto);
			}
			CategoryDTO[] ctdto = new CategoryDTO[al.size()];
			al.toArray(ctdto);
			return ctdto;
		}finally{
			if (rs != null) rs.close();
			if (ps != null) ps.close();
			if (con != null) con.close();
		}
	}
	
	public int delete(String cnum) throws SQLException {
		String sql = "delete from category where cnum=?";
		try{
			con = ds.getConnection();
			ps = con.prepareStatement(sql);
			ps.setString(1, cnum);
			int res = ps.executeUpdate();
			return res;
		}finally{
			if (ps != null) ps.close();
			if (con != null) con.close();
		}
	}
	
	public boolean check(CategoryDTO dto) throws SQLException{
		String sql = "select * from category where code=? or cname=?";
		try{
			con = ds.getConnection();
			ps = con.prepareStatement(sql);
			ps.setString(1, dto.getCode());
			ps.setString(2, dto.getCname());
			rs = ps.executeQuery();
			if (rs.next()){
				return true;
			}else {
				return false;
			}
		}finally{
			if (rs != null) rs.close();
			if (ps != null) ps.close();
			if (con != null) con.close();
		}
	}
}









