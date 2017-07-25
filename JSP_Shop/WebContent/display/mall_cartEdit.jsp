<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<jsp:useBean id="cart" class="myshop.mall.CartBean" scope="session" />    
<%
		String pnum = request.getParameter("pnum");
		String sqty = request.getParameter("qty");
		if (pnum==null || pnum.trim().equals("")){
			response.sendRedirect("mall.jsp");
			return;
		}
		 
		cart.editProduct(pnum, sqty);
%>
<script type="text/javascript">
	location.href="mall_cartList.jsp";
</script>