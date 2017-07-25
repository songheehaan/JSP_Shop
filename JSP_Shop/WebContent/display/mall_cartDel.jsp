<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<jsp:useBean id="cart" class="myshop.mall.CartBean" scope="session" />
<%
		String pnum = request.getParameter("pnum");
		if (pnum==null || pnum.trim().equals("")){
			response.sendRedirect("mall.jsp");
			return;
		}
		
		cart.deleteProduct(pnum);
%>
<script type="text/javascript">
	location.href="mall_cartList.jsp";
</script>

