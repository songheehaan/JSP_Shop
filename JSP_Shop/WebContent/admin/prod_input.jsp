<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import="java.util.*, myshop.*" %>    
<%@ include file="top.jsp"%>
<jsp:useBean id="ctdao" class="myshop.CategoryBean" />
<link rel="stylesheet" type="text/css" href="../../style.css">
<%
		CategoryDTO[] list = ctdao.list();
		if (list == null || list.length==0){%>
		<script type="text/javascript">
			alert("Please create a category first");
			location.href="cate_input.jsp";
		</script>
<%		return;
		}
%>
<form name="f" action="prod_input_ok.jsp" method="post" enctype="multipart/form-data">
	<table border="0" class="outline" width="600">
		<caption>Add Product</caption>
		<tr>
			<th class="m2">Category</th>
			<td align="left">
				<select name="pcategory_fk">
<%		for(CategoryDTO dto : list){%>
				<option value="<%=dto.getCode()%>">
						<%=dto.getCname()%>[<%=dto.getCode()%>]</option>
<%		}%>
				</select>
			</td>
		</tr>
		<tr>
			<th class="m2">Product name</th>
			<td align="left"><input type="text" name="pname"></td>
		</tr>
		<tr>
			<th class="m2">Product Code</th>
			<td align="left"><input type="text" name="pcode"></td>
		</tr>
		<tr>
			<th class="m2">Manufacturing company</th>
			<td align="left"><input type="text" name="pcompany"></td>
		</tr>
		<tr>
			<th class="m2">Product image</th>
			<td align="left"><input type="file" name="pimage"></td>
		</tr>
		<tr>
			<th class="m2">Product quantity</th>
			<td align="left"><input type="text" name="pqty"></td>
		</tr>
		<tr>
			<th class="m2">Product price</th>
			<td align="left"><input type="text" name="price"></td>
		</tr>
		<tr>
			<th class="m2">Product spec</th>
			<td align="left">
				<select name="pspec">
					<option value="none" selected>::NORMAL::</option>
					<option value="HIT">HIT</option>
					<option value="NEW">NEW</option>
					<option value="BEST">BEST</option>
				</select>
			</td>	
		</tr>
		<tr>
			<th class="m2">Product detail</th>
			<td align="left">
				<textarea name="pcontents" rows="5" cols="50"></textarea>
			</td>
		</tr>
		<tr>
			<th class="m2">point</th>
			<td align="left"><input type="text" name="point"></td>
		</tr>
		<tr>
			<td colspan="2" class="m1">
				<input type="submit" value="Add">
				<input type="reset" value="Cancel">
			</td>
		</tr>			
	</table>
</form>
<%@ include file="bottom.jsp"%>









