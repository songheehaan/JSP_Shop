package myshop;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

import com.oreilly.servlet.MultipartRequest;

public class ProductBean {
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
	
	public int insert(MultipartRequest mr) throws SQLException {
		String sql = "insert into product values(prod_seq.nextval, ?,?,?,?,?,?,?,?,?,?)";
		try{
			con = ds.getConnection();
			ps = con.prepareStatement(sql);
			ps.setString(1, mr.getParameter("pname"));
			String code = mr.getParameter("pcategory_fk") + mr.getParameter("pcode");
			ps.setString(2, code);
			ps.setString(3, mr.getParameter("pcompany"));
			ps.setString(4, mr.getFilesystemName("pimage"));
			ps.setInt(5, Integer.parseInt(mr.getParameter("pqty")));
			ps.setInt(6, Integer.parseInt(mr.getParameter("price")));
			ps.setString(7, mr.getParameter("pspec"));
			ps.setString(8, mr.getParameter("pcontents"));
			ps.setInt(9, Integer.parseInt(mr.getParameter("point")));
			java.util.Date date = new java.util.Date();
			java.text.SimpleDateFormat sdf = new java.text.SimpleDateFormat("yyyy-MM-dd");
			ps.setString(10, sdf.format(date));
			int res = ps.executeUpdate();
			return res;
		}finally{
			if (ps != null) ps.close();
			if (con != null) con.close();
		}
	}
	
	public ArrayList<ProductDTO> list() throws SQLException {
		String sql = "select * from product";
		try{
			con = ds.getConnection();
			ps = con.prepareStatement(sql);
			rs = ps.executeQuery();
			ArrayList<ProductDTO> al = makeArrayList(rs);
			return al;
		}finally{
			if (rs != null) rs.close();
			if (ps != null) ps.close();
			if (con != null) con.close();
		}
	}
	public ArrayList<ProductDTO> makeArrayList(ResultSet rs) throws SQLException {
		ArrayList<ProductDTO> al = new ArrayList<ProductDTO>();
		while(rs.next()){
			String pnum = rs.getString(1);
			String pname = rs.getString(2);
			String pcategory_fk = rs.getString(3);
			String pcompany = rs.getString(4);
			String pimage = rs.getString(5);
			int pqty = rs.getInt(6);
			int price = rs.getInt(7);
			String pspec = rs.getString(8);
			String pcontents = rs.getString(9);
			int point = rs.getInt(10);
			String pinputdate = rs.getString(11);
			ProductDTO dto = new ProductDTO(pnum, pname, pcategory_fk, pcompany, 
					pimage, pqty, price, pspec, pcontents, point, pinputdate);
			al.add(dto);
		}
		return al;
	}
	public ProductDTO getProduct(String pnum) throws SQLException {
		String sql = "select * from product where pnum=?";
		try{
			con = ds.getConnection();
			ps = con.prepareStatement(sql);
			ps.setString(1, pnum);
			rs = ps.executeQuery();
			ArrayList<ProductDTO> al = makeArrayList(rs);
			return al.get(0);
		}finally{
			if (rs != null) rs.close();
			if (ps != null) ps.close();
			if (con != null) con.close();
		}
	}
	public int deleteProduct(String pnum) throws SQLException {
		String sql = "delete from product where pnum=?";
		try{
			con = ds.getConnection();
			ps = con.prepareStatement(sql);
			ps.setString(1, pnum);
			int result = ps.executeUpdate();
			return result;
		}finally{
			if (ps != null) ps.close();
			if (con != null) con.close();
		}
	}
	
	public int updateProduct(MultipartRequest mr) throws SQLException{
		String sql = "update product set pname=?, pcompany=?, pimage=?,"
				+ " pqty=?, price=?, pspec=?, pcontents=?, point=? where pnum=?";
		try{
			con = ds.getConnection();
			ps = con.prepareStatement(sql);
			ps.setString(1, mr.getParameter("pname"));
			ps.setString(2, mr.getParameter("pcompany"));
			String pimage = mr.getFilesystemName("pimage");
			if (pimage==null) {
				pimage = mr.getParameter("pimage2");
			}
			ps.setString(3, pimage);
			ps.setInt(4, Integer.parseInt(mr.getParameter("pqty")));
			ps.setInt(5, Integer.parseInt(mr.getParameter("price")));
			ps.setString(6, mr.getParameter("pspec"));
			ps.setString(7, mr.getParameter("pcontents"));
			ps.setInt(8, Integer.parseInt(mr.getParameter("point")));
			ps.setString(9, mr.getParameter("pnum"));
			int result = ps.executeUpdate();
			return result;
		}finally{
			if (ps != null) ps.close();
			if (con != null) con.close();
		}
	}
}











