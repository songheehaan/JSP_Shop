<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import="com.oreilly.servlet.*, java.io.*" %>
<jsp:useBean id="pdao" class="myshop.ProductBean" />
<% 
		MultipartRequest mr = null;
		String msg = null;
		String url = null;
		String upPath = application.getRealPath("/images");
		try{
			mr = new MultipartRequest(request, upPath, 10*1024*1024, "EUC-KR");
			int result = pdao.updateProduct(mr);  
			if (result>0){
				msg = "Product edited. Redirecting to product list.";
				url = "prod_list.jsp";
			}else {
				msg = "Fail. Redirecting to product list.";
				url = "prod_list.jsp";
			}
		}catch(IOException e){
			msg = "File upload fail.";
			url = "prod_update.jsp?pnum="+request.getParameter("pnum");
		}
%>
<script type="text/javascript">
	alert("<%=msg%>");
	location.href="<%=url%>";
</script>






