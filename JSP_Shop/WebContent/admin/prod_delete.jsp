<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR" import="java.io.*"%>
<jsp:useBean id="pdao" class="myshop.ProductBean" />
<% 
		request.setCharacterEncoding("EUC-KR");
		String pnum = request.getParameter("pnum");
		String pimage = request.getParameter("pimage");
		if (pnum==null || pnum.trim().equals("")){
			response.sendRedirect("prod_list.jsp");
			return;
		}
		int result = pdao.deleteProduct(pnum);
		String msg = null;
		String url = "prod_list.jsp";
		if (result>0){
			String delPath = application.getRealPath("/myshop/images");
			File dir = new File(delPath);
			File delFile = new File(dir, pimage);
			if (delFile.exists()){
				delFile.delete();
				msg = "Product deleted. Redirecting to product list.";
			}else {
				msg = "Product deleted. Please delete the image. Redirecting to product list.";
			}
		}else {
			msg = "Fail. Redirecting to product list.";
		}
%>
<script type="text/javascript">
	alert("<%=msg%>");
	location.href="<%=url%>";
</script>




