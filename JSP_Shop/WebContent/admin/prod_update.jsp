<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR" import="myshop.*"%>
<%@ include file="top.jsp" %>
<jsp:useBean id="pdao" class="myshop.ProductBean" />
<%
		String pnum = request.getParameter("pnum");
		if (pnum==null || pnum.trim().equals("")){
			response.sendRedirect("prod_list.jsp");
			return;
		}
		
		ProductDTO dto = pdao.getProduct(pnum);
%>
<form name="f" action="prod_update_ok.jsp" method="post" enctype="multipart/form-data">
	<table border="0" class="outline" width="600">
		<caption>Edit Product Detail</caption>
		<tr>
			<th class="m2">Category</th>
			<td align="left">
				<input type="text" name="pcategory_fk" value="<%=dto.getPcategory_fk()%>" disabled>			
			</td>
		</tr>
		<tr>
			<th class="m2">Product number</th>
			<td align="left"><%=pnum%></td>
			<input type="hidden" name="pnum" value="<%=pnum%>" >
		</tr>
		<tr>
			<th class="m2">Product name</th>
			<td align="left"><input type="text" name="pname" value="<%=dto.getPname()%>"></td>
		</tr>
		<tr>
			<th class="m2">Manufacturing company</th>
			<td align="left"><input type="text" name="pcompany" value="<%=dto.getPcompany()%>"></td>
		</tr>
		<tr>
<%	String upPath = config.getServletContext().getRealPath("/images");
		String filename = upPath + "\\" + dto.getPimage();%>			
			<th class="m2">Product image</th>
			<td align="left">
				<img src="<%=filename%>" border="0" width="80" height="80">
				<input type="file" name="pimage">
				<input type="hidden" name="pimage2" value="<%=dto.getPimage()%>">
			</td>
		</tr>
		<tr>
			<th class="m2">Product Quantity</th>
			<td align="left"><input type="text" name="pqty" value="<%=dto.getPqty()%>"></td>
		</tr>
		<tr>
			<th class="m2">Product Price</th>
			<td align="left"><input type="text" name="price" value="<%=dto.getPrice()%>"></td>
		</tr>
		<tr>
<%
		String spec[] = new String[]{"none", "HIT", "NEW", "BEST"};
%>		
			<th class="m2">Product spec</th>
			<td align="left">
				<select name="pspec">
<%				for(int i=0; i<spec.length; ++i){
						if (dto.getPspec().equals(spec[i])){%>
							<option value="<%=spec[i]%>" selected><%=spec[i]%></option>
<%					}else {%>
							<option value="<%=spec[i]%>"><%=spec[i]%></option>
<%					}
					}%>				
				</select>
			</td>	
		</tr>
		<tr>
			<th class="m2">Product detail</th>
			<td align="left">
				<textarea name="pcontents" rows="5" cols="50"><%=dto.getPcontents()%></textarea>
			</td>
		</tr>
		<tr>
			<th class="m2">point</th>
			<td align="left"><input type="text" name="point" value="<%=dto.getPoint()%>"></td>
		</tr>
		<tr>
			<td colspan="2" class="m1">
				<input type="submit" value="Edit">
				<input type="reset" value="Cancel">
			</td>
		</tr>			
	</table>
</form>
<%@ include file="bottom.jsp" %>
