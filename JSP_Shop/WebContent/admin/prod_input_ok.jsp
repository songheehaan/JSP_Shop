<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import="com.oreilly.servlet.*, java.io.*" %>    
<jsp:useBean id="pdao" class="myshop.ProductBean" />
<%
		MultipartRequest mr = null;
		String upPath = config.getServletContext().getRealPath("/images");
		String msg = null;
		String url = null;
		try{
			mr = new MultipartRequest(request, upPath, 10*1024*1024, "EUC-KR");
			int result = pdao.insert(mr);
			if (result>0){
				msg = "Product created. Redirecting to product list.";
				url = "prod_list.jsp";
			}else {
				msg = "Fail. Redirecting to product input page.";
				url = "prod_input.jsp";
			}
		}catch(IOException e){
			msg = "Image upload incomplete. Redirecting to product input page.";
			url = "prod_input.jsp";
			e.printStackTrace();
		}
%>
<script type="text/javascript">
	alert("<%=msg%>");
	location.href="<%=url%>";
</script>

















