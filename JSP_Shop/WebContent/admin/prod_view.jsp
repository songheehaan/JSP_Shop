<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR" import="myshop.*"%>
<jsp:useBean id="pdao" class="myshop.ProductBean" />
<%
		String pnum = request.getParameter("pnum");
		if (pnum==null || pnum.trim().equals("")){
			response.sendRedirect("prod_list.jsp");
			return;
		}
		ProductDTO dto = pdao.getProduct(pnum);  
%>    
<%@ include file="top.jsp"%>
<form name="f" action="prod_list.jsp" method="post">
	<table class="outline" width="75%">
	<caption>Product</caption>
		<tr>
			<th width="15%" class="m2">Category</th>
			<td width="35%" align="center"><%=dto.getPcategory_fk()%></td>
			<th width="15%" class="m2">Product number</th>
			<td width="35%" align="center"><%=dto.getPnum()%></td>
		</tr>
		<tr>
			<th width="15%" class="m2">Product name</th>
			<td width="35%" align="center"><%=dto.getPname()%></td>
			<th width="15%" class="m2">Manufacturing company</th>
			<td width="35%" align="center"><%=dto.getPcompany()%></td>
		</tr>
		<tr>
			<th width="15%" class="m2">Product image</th>
<%	String upPath = config.getServletContext().getRealPath("/images");
		String filename = upPath + "\\" + dto.getPimage();%>			
			<td width="35%" align="center" colspan="3">
				<img src="<%=filename%>" border="0" width="140" height="140">
			</td>
		</tr>
		<tr>
			<th width="15%" class="m2">Product quantity</th>
			<td width="35%" align="center"><%=dto.getPqty()%></td>
			<th width="15%" class="m2">Product price</th>
			<td width="35%" align="center"><%=dto.getPrice()%></td>
		</tr>
		<tr>
			<th width="15%" class="m2">Product spec</th>
			<td width="35%" align="center"><%=dto.getPspec()%></td>
			<th width="15%" class="m2">point</th>
			<td width="35%" align="center"><%=dto.getPoint()%></td>
		</tr>
		<tr>
			<th width="15%" class="m2">Product detail</th>
			<td width="35%" align="center" colspan="3">
				<textarea name="pcontents" rows="5" cols="50" readOnly><%=dto.getPcontents()%></textarea>
			</td>
		</tr>
		<tr>
			<td colspan="4" class="m1" align="center">
				<input type="submit" value="Back">
			</td>
		</tr>
	</table>
</form>	
<%@ include file="bottom.jsp"%>










