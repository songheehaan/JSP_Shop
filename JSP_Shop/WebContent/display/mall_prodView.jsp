<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ include file="mall_top.jsp"%>
<jsp:useBean id="prolist" class="myshop.mall.ProductList" scope="session" />

<script type="text/javascript">
	function goCart(){
		document.f.action="<%=request.getContextPath()%>/display/mall_cartAdd.jsp";
		document.f.submit();
	}
	function goOrder(){
		document.f.action="<%=request.getContextPath()%>/display/mall_order.jsp";
		document.f.submit();
	}
</script>
<%  
		String pnum = request.getParameter("pnum");
		String select = request.getParameter("select");
		
		if (pnum == null || pnum.trim().equals("")){
			response.sendRedirect("mall.jsp");
			return;
		}
		ProductDTO dto = prolist.getProduct(select, pnum);
		if (dto == null) {
			response.sendRedirect("mall.jsp");
			return;
		}
%>
<table width="99%" border="0" class="outline">
	<tr class="m1">
		<td colspan="2" align="center">
			<b>[<%=dto.getPname()%>] Product information</b>
		</td>
	</tr>
	<tr>
		<td align="center" class="m3">
			<img src="../images/<%=dto.getPimage()%>" width="200" height="200" border="0">
		</td>
		<td class="m3">
			<form name="f" method="post">
				Product number : <%=pnum%><br>
				Product name : <%=dto.getPname()%><br>
				Product price : <font color="red"><%=dto.getPrice()%></font>$<br>
				Product point : <font color="red">[<%=dto.getPoint()%>]</font>point<br>
				Product quantity : <input type="text" name="qty" size="3" value="1"><br><br>
				<input type="hidden" name="pnum" value="<%=pnum%>">
				<input type="hidden" name="select" value="<%=select%>">
				<a href="javascript:goCart()">Cart</a>
				<a href="javascript:goOrder()">Buy Now</a>
			</form>	
		</td>
	</tr>	
	<tr>
		<td colspan="2" align="left">
			<b>Product detail </b><br>
			<%=dto.getPcontents()%>
		</td>
	</tr>		
</table>
<%@ include file="mall_bottom.jsp"%>









