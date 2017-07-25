<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<jsp:useBean id="cart" class="myshop.mall.CartBean" scope="session" />   
<%	Vector<ProductDTO> vcart = cart.list(); 
		if (vcart.size()==0){%>
			<script type="text/javascript">
				alert("No item in the cart.");
				location.href="mall.jsp";
			</script>	
<%		return;
		}%>
<%@ include file="mall_top.jsp" %>
<table border="1">
	<tr>
		<th colspan="6">
			Cart
		</th>
	</tr>
	<tr>
		<th>Number</th>
		<th>Product name</th>
		<th>Product quantity</th>
		<th>Product price</th>
		<th>Total price</th>
		<th>Delete</th>
	</tr>	
<%	for(ProductDTO pdto : vcart){ %>
	<tr>
		<td><%=pdto.getPnum()%></td>
		<td>
			<img src="../images/<%=pdto.getPimage()%>" width="40" height="40"><br>
			<%=pdto.getPname()%>
		</td>	
		<td>
			<form name="f" method="post" action="mall_cartEdit.jsp">
				<input type="text" name="qty" value="<%=pdto.getPqty()%>" size="3">
				<input type="hidden" name="pnum" value="<%=pdto.getPnum()%>">
				<br><input type="submit" value="Edit">
			</form>	
		</td>
		<td>
			<%=pdto.getPrice()%>$<br>
			[<%=pdto.getPoint()%>] point
		</td>
		<td>
			<%=pdto.getPrice()*pdto.getPqty()%>$<br>
			[<%=pdto.getPoint()*pdto.getPqty()%>] point
		</td>	
		<td>
			<a href="mall_cartDel.jsp?pnum=<%=pdto.getPnum()%>">Delete</a>
		</td>
<%	} %>
</table>
<%@ include file="mall_bottom.jsp" %>







