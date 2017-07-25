<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<jsp:useBean id="ctdao" class="myshop.CategoryBean" />
<%
		String cnum = request.getParameter("cnum");
		if (cnum==null || cnum.trim().equals("")){
			response.sendRedirect("cate_list.jsp");
			return;
		}
		
		int result = ctdao.delete(cnum);
		String msg = null;
		String url = null;
		if (result>0) {
			msg = "Category deleted. Redirecting to category list";
			url = "cate_list.jsp";
		}else {
			msg = "Fail. Redirecting to category list";
			url = "cate_list.jsp";
		}
%>
<script type="text/javascript">
	alert("<%=msg%>");
	location.href="<%=url%>";
</script>