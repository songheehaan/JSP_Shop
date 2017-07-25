<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import="java.util.*, myshop.*" %>  
<jsp:useBean id="ctdao" class="myshop.CategoryBean" />
<%
		CategoryDTO[] list = ctdao.list(); 
		if (list==null || list.length==0){%>
		<script type="text/javascript">
			alert("ºÓ«Œ∏Ù ¡ÿ∫Ò¡ﬂ ¿‘¥œ¥Ÿ.");
			location.href="<%=request.getContextPath()%>/main.jsp";
		</script>
<%		return;
		}%>	
<html>
<head>
	<title>Shop</title>
	<link rel="stylesheet" type="text/css" href="../../style.css">
</head>
<body>
	<table border="1" align="center" width="770">
		<tr height="50">
			<td colspan="2" align="center">
				<a href="<%=request.getContextPath()%>/display/mall.jsp">Home</a> |
				<a href="<%=request.getContextPath()%>/display/mall_cartList.jsp">Cart</a> |
			</td>
		</tr>
		<tr height="400">
			<td width="20%" align="center" valign="top">
				<table width="99%" align="center" border="1">
<%				for(CategoryDTO dto : list){%>
					<tr>
						<td>
							<a href="mall_cgProdList.jsp?code=<%=dto.getCode()%>&cname=<%=dto.getCname()%>">
								<%=dto.getCname()%>[<%=dto.getCode()%>]
							</a>
						</td>
					</tr>		
<%				}%>					
				</table>
			</td>
			<td align="center">