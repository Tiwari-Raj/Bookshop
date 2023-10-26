<%@page import="com.entity.Book_Order"%>
<%@page import="java.util.List"%>
<%@page import="com.DB.DB_Connect"%>
<%@page import="com.DOA.BookOrderDAOImpl"%>
<%@page import="com.entity.User"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Admin Order</title>
<%@include file="all-css.jsp"%>
</head>
<body>
	<%@include file="navbar.jsp"%>
	<c:if test="${empty userobj }">
		<c:redirect url="../login.jsp">

		</c:redirect>
	</c:if>

	<h4 class="text-center pt-2">
		<b><i class="fa-solid fa-user"></i> Hello Admin</b>
	</h4>

	<table class="table table-striped">
		<thead class="bg-secondary text-white">
			<tr>
				<th scope="col">Oredr Id</th>
				<th scope="col">Name</th>
				<th scope="col">Email</th>
				<th scope="col">Address</th>
				<th scope="col">Phone No</th>
				<th scope="col">Book Name</th>
				<th scope="col">Price</th>
				<th scope="col">Payment Type</th>
			</tr>
		</thead>
		<tbody>
		
		
				<%
				User u = (User) session.getAttribute("userobj");
				BookOrderDAOImpl dao = new BookOrderDAOImpl(DB_Connect.getConn());
				List<Book_Order> blist = dao.getAllOrder();
				for (Book_Order b : blist) {
				%>
		<tr>
					<th scope="row"><%=b.getOrderId()%></th>
					<td><%=b.getUserName() %></td>
					<td><%=b.getEmail() %></td>
					<td><%=b.getFulladd() %></td>
					<td><%=b.getPhno() %></td>
					<td><%=b.getBookName() %></td>
					<td><%=b.getPrice() %></td>
					<td><%=b.getPaymentType() %></td>

				</tr>

				<%
				}
				%>
		
			
			
		</tbody>
	</table>
	<div class="p-5">
	<%@include file="footer.jsp"%></div>


</body>
</html>