package myshop.mall;

import java.util.*;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

import java.sql.*;

import myshop.*;

public class ProductList {
	Vector<ProductDTO> p_list, p_list2;
	Hashtable<String, Vector<ProductDTO>> ht;
	Connection con;
	PreparedStatement ps;
	ResultSet rs;
	
	static DataSource ds;
	static{
		try{
			Context init = new InitialContext();
			ds = (DataSource)init.lookup("java:comp/env/jdbc/oracle");
		}catch(NamingException e){
			System.out.println("lookup실패 : " + e.getMessage());
		}
	}
	
	public ProductList(){
		p_list = new Vector<ProductDTO>(5, 3);
		p_list2 = new Vector<ProductDTO>(5, 3);
		ht = new Hashtable<String, Vector<ProductDTO>>();
		/*System.out.println("생성자 호출!!!!");*/
	}
	
	public Vector<ProductDTO> selectBySpec(String pspec) throws SQLException{
		String sql = "select * from product where pspec = ?";
		try{
			con = ds.getConnection();
			ps = con.prepareStatement(sql);
			ps.setString(1, pspec);
			rs = ps.executeQuery();
			p_list = this.makeVector(rs);
			ht.put(pspec, p_list);
			return p_list;
		}finally{
			if (rs != null) rs.close();
			if (ps != null) ps.close();
			if (con != null) con.close();
		}
	}
	
	public Vector<ProductDTO> makeVector(ResultSet rs) throws SQLException {
		Vector<ProductDTO> v = new Vector<ProductDTO>();
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
			v.add(dto);
		}
		return v;
	}
	
	public Vector<ProductDTO> selectByCode(String code) throws SQLException{
		String sql = "select * from product where pcategory_fk like ?";
		try{
			con = ds.getConnection();
			ps = con.prepareStatement(sql);
			ps.setString(1, code+"%");
			rs = ps.executeQuery();
			p_list = this.makeVector(rs);
			ht.put(code, p_list);
			return p_list;
		}finally{
			if (rs != null) rs.close();
			if (ps != null) ps.close();
			if (con != null) con.close();
		}
	}
	public ProductDTO getProduct(String select, String pnum) {
		p_list2 = ht.get(select);
		for(ProductDTO dto : p_list2){
			if (dto.getPnum().equals(pnum.trim())){
				return dto;
			}
		}
		return null;
	}
}

















