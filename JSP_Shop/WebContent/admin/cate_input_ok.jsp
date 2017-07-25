<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%
		request.setCharacterEncoding("EUC-KR");
%>
<jsp:useBean id="ctdto" class="myshop.CategoryDTO" />
<jsp:setProperty property="*" name="ctdto" />
<jsp:useBean id="ctdao" class="myshop.CategoryBean" />

<%
		if (ctdto.getCode()==null || ctdto.getCname()==null |
				ctdto.getCode().trim().equals("") || ctdto.getCname().trim().equals("")){
			response.sendRedirect("cate_input.jsp");
			return;
		}
		boolean isCheck = ctdao.check(ctdto);
		if (isCheck){%> 
		<script type="text/javascript">
			alert("Category code or name is duplicated. Please retype");
			location.href="cate_input.jsp";
		</script>
<%		return;
		}
		int result = ctdao.insert(ctdto); 
		String msg = null;
		String url = null;
		if (result>0) {
			msg = "Category created. Redirecting to category list.";
			url = "cate_list.jsp";
		}else {
			msg = "Fail. Redirecting to category list.";
			url = "cate_input.jsp";
		}
%>
<script type="text/javascript">
	alert("<%=msg%>");
	location.href="<%=url%>";
</script>







