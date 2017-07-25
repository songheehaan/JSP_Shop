<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import="java.text.*" %>    
<%@ include file="mall_top.jsp" %>
<jsp:useBean id="prolist" class="myshop.mall.ProductList" scope="session" />
<%
		String code = request.getParameter("code");
		String cname = request.getParameter("cname");
		if (code==null || code.trim().equals("")){
			response.sendRedirect("mall.jsp");
			return;
		}
		cname = new String(cname.getBytes("8859_1"), "EUC-KR");//get방식에서의 한글처리방식
%>
<h3>Welcome to My Mall</h3> 
<%DecimalFormat df = new DecimalFormat("###,###");
	Vector<ProductDTO> plist = prolist.selectByCode(code); 
	if (plist==null || plist.size()==0){
		out.println("<b>"+cname+" No Product </b><br>");
	}else {%>
		<hr color="green" width="80%">
		<font color="red" size="3"><%=cname%></font>
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
					<a href="mall_prodView.jsp?pnum=<%=pnum%>&select=<%=code%>">
						<img src="../images/<%=pimage%>" width="80" height="60" border="0">
					</a>	
					<br>
					<%=pname%><br>
					<font color="red"><%=df.format(price)%></font>원<br>
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