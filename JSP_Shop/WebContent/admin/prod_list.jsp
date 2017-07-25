<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import="java.util.*, myshop.*" %>
<jsp:useBean id="pdao" class="myshop.ProductBean" />
<%@ include file="top.jsp"%>
<script type="text/javascript"> 
	function checkDel(pnum, pimage){
		var isDel = window.confirm("Do you really want to delete? ");
		if (isDel){
			location.href="prod_delete.jsp?pnum="+pnum + "&pimage="+pimage;
		}
	}
</script>
<table class="outline" width="99%">
	<caption>Product List</caption>
	<tr class="m2">
		<th>Number</th>
		<th>Product code</th>
		<th>Product name</th>
		<th>Image</th>
		<th>Price</th>
		<th>Manufacturing company</th>
		<th>Quantity</th>
		<th>Edit|Delete</th>
	</tr>
<%	
		ArrayList<ProductDTO> list = pdao.list(); 
		if (list == null || list.size()==0){%> 
	<tr>
		<td colspan="8" align="center">
			No Product
		</td>
	</tr>		
<%	}else {
			for(ProductDTO dto : list){%>
	<tr>
		<td><%=dto.getPnum()%></td>
		<td><%=dto.getPcategory_fk()%></td>
		<td><%=dto.getPname()%></td>
<%	String upPath = config.getServletContext().getRealPath("/images");
		String filename = upPath + "\\" + dto.getPimage();%>		
		<td>
			<a href="prod_view.jsp?pnum=<%=dto.getPnum()%>">
				<img src="<%=filename%>" border="0" width="40" height="40">
			</a>
		</td>
		<td><%=dto.getPrice()%></td>
		<td><%=dto.getPcompany()%></td>
		<td><%=dto.getPqty()%></td>  
		<td>
			<a href="prod_update.jsp?pnum=<%=dto.getPnum()%>">Edit</a> |
			<a href="javascript:checkDel('<%=dto.getPnum()%>','<%=dto.getPimage()%>');">Delete</a>
		</td>
	</tr>
<%		}
		}
%>	
</table>
<%@ include file="bottom.jsp"%>