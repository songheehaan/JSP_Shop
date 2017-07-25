<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import="java.text.*" %>    
<%@ include file="mall_top.jsp" %>
<jsp:useBean id="prolist" class="myshop.mall.ProductList" scope="session" />
<h3>Welcome to My Mall</h3> 
<%DecimalFormat df = new DecimalFormat("###,###");%> 
	 
<%Vector<ProductDTO> plist = prolist.selectBySpec("HIT"); 
	if (plist==null || plist.size()==0){
		out.println("<b>No HIT product</b><br>");
	}else {%>
		<hr color="green" width="80%">
		<font color="red" size="3">HIT</font>
		<hr color="green" width="80%">
		<br>
		<table width="100%" border="0" align="center">
			<tr>
<%			int count = 0;
				for(ProductDTO dto : plist){
					count++;
					String pimage = dto.getPimage();
					String pnum = dto.getPnum();
					String pname = dto.getPname();
					int price = dto.getPrice();
					int point = dto.getPoint();%>
				<td align="center">
					<a href="mall_prodView.jsp?pnum=<%=pnum%>&select=HIT">
						<img src="../images/<%=pimage%>" width="80" height="60" border="0">
					</a>	
					<br>
					<%=pname%><br>
					<font color="red"><%=df.format(price)%></font>¿ø<br>
					<font color="blue">[<%=point%>]</font>point
				</td>
<%				if (count%3==0){ %>
					</tr><tr>
<%				}%>
<%			}%>
			</tr>
		</table>
<%}%>
<%Vector<ProductDTO> plist2 = prolist.selectBySpec("NEW"); 
	if (plist2==null || plist2.size()==0){
		out.println("<b>No NEW Product</b><br>");
	}else {%>
		<hr color="green" width="80%">
		<font color="red" size="3">NEW</font>
		<hr color="green" width="80%">
		<br>
		<table width="100%" border="0" align="center">
			<tr>
<%			int count = 0;
				for(ProductDTO dto : plist2){
					count++;
					String pimage = dto.getPimage();
					String pnum = dto.getPnum();
					String pname = dto.getPname();
					int price = dto.getPrice();
					int point = dto.getPoint();%>
				<td align="center">
					<a href="mall_prodView.jsp?pnum=<%=pnum%>&select=NEW">
						<img src="../images/<%=pimage%>" width="80" height="60" border="0">
					</a>	
					<br>
					<%=pname%><br>
					<font color="red"><%=df.format(price)%></font>¿ø<br>
					<font color="blue">[<%=point%>]</font>point
				</td>
<%				if (count%3==0){ %>
					</tr><tr>
<%				}%>
<%			}%>
			</tr>
		</table>
<%}%>
<%Vector<ProductDTO> plist3 = prolist.selectBySpec("BEST"); 
	if (plist3==null || plist3.size()==0){
		out.println("<b>No BEST Product</b><br>");
	}else {%>
		<hr color="green" width="80%">
		<font color="red" size="3">BEST</font>
		<hr color="green" width="80%">
		<br>
		<table width="100%" border="0" align="center">
			<tr>
<%			int count = 0;
				for(ProductDTO dto : plist3){
					count++;
					String pimage = dto.getPimage();
					String pnum = dto.getPnum();
					String pname = dto.getPname();
					int price = dto.getPrice();
					int point = dto.getPoint();%>
				<td align="center">
					<a href="mall_prodView.jsp?pnum=<%=pnum%>&select=BEST">
						<img src="../images/<%=pimage%>" width="80" height="60" border="0">
					</a>	
					<br>
					<%=pname%><br>
					<font color="red"><%=df.format(price)%></font>¿ø<br>
					<font color="blue">[<%=point%>]</font>point
				</td>
<%				if (count%3==0){ %>
					</tr><tr>
<%				}%>
<%			}%>
			</tr>
		</table>
<%}%>
<%@ include file="mall_bottom.jsp"%>
			
			
			
			
			
			
			
			
			
			
			