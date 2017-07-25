<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ include file="top.jsp" %>
	<form name="f" action="cate_input_ok.jsp" method="post">
		<table border="1" width="500" height="150">
		<caption>Create Category</caption>
		<tr>
			<th>Category Code</th>
			<td><input type="text" name="code"></td>
		</tr>
		<tr>
			<th>Category Name</th>
			<td><input type="text" name="cname"></td>
		</tr>
		<tr>
			<td colspan="2" align="center">
				<input type="submit" value="Create">
				<input type="reset" value="Cancel">
			</td>
		</tr>	
	</table>
	</form>
<%@ include file="bottom.jsp" %>