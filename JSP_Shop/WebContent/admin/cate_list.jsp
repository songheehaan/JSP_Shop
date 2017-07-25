<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR" import="myshop.*" %>
<%@ include file = "top.jsp" %>
<jsp:useBean id="ctdao" class="myshop.CategoryBean" />
	<table border="1" width="600">
		<caption>Category List</caption>
		<tr>
			<th>Number</th>
			<th>Category Code</th>
			<th>Category Name</th>
			<th>Delete</th>
		</tr>
<% 
		CategoryDTO[] dto = ctdao.list(); 
		if (dto == null || dto.length==0){%>
		<tr>
			<td colspan="4">
				No Category
			</td>
		</tr>
<%	}else {
			for(int i=0; i<dto.length; ++i){%>
		<tr>
			<td><%=dto[i].getCnum()%></td>	
			<td><%=dto[i].getCode()%></td>
			<td><%=dto[i].getCname()%></td>
			<td><a href="cate_delete.jsp?cnum=<%=dto[i].getCnum()%>">ªË¡¶</a>
<%		}
		}%>					
	</table>
<%@ include file = "bottom.jsp" %>









