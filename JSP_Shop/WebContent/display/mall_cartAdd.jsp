<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<jsp:useBean id="cart" class="myshop.mall.CartBean" scope="session" />   
<jsp:useBean id="prolist" class="myshop.mall.ProductList" scope="session" />
<jsp:setProperty property="list" name="cart" value="<%=prolist%>" />
<%
		request.setCharacterEncoding("EUC-KR");
		String sqty = request.getParameter("qty");
		String select = request.getParameter("select");
		String pnum = request.getParameter("pnum");
		
		if (pnum==null || pnum.trim().equals("")){
			response.sendRedirect("mall.jsp");
			return;
		}
		cart.addProduct(sqty, select, pnum);
%>
<script type="text/javascript">
	location.href="mall_cartList.jsp";
</script>





