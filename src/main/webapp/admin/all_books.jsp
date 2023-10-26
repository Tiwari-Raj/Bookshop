<%@page import="org.apache.jasper.tagplugins.jstl.core.ForEach"%>
<%@page import="com.entity.BookDtls"%>
<%@page import="java.util.List"%>
<%@page import="com.DB.DB_Connect"%>
<%@page import="com.DOA.BookDAOImpl"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Admin All Books</title>
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

	<c:if test="${not empty succMsg }">
		<h4 class="text-center text-success">${succMsg}</h4>
		<c:remove var="succMsg" scope="session" />
	</c:if>

	<c:if test="${not empty failedMsg }">
		<h4 class="text-center text-danger">${failedMsg}</h4>
		<c:remove var="failedMsg" scope="session" />
	</c:if>



	<table class="table table-striped">
		<thead class="bg-secondary text-white">
			<tr>
				<th scope="col">ID</th>
				<th scope="col">Image</th>
				<th scope="col">Book Name</th>
				<th scope="col">Price</th>
				<th scope="col">Catagories</th>
				<th scope="col">Status</th>
				<th scope="col">Action</th>
			</tr>
		</thead>
		<tbody>

			<%
			BookDAOImpl dao = new BookDAOImpl(DB_Connect.getConn());
			List<BookDtls> list = dao.getAllBooks();

			for (BookDtls b : list) {
			%>

			<tr>
				<td><%=b.getBookId()%></td>
				<td><img src="../../books/<%=b.getPhotoName()%>"
					style="height: 50px;"></td>
				<td><%=b.getBookName()%></td>
				<td><%=b.getPrice()%></td>
				<td><%=b.getBookCategory()%></td>
				<td><%=b.getStatus()%></td>

				<td><a href="edit_books.jsp?id=<%=b.getBookId()%>"
					class="btn btn-sm btn-success"><i
						class="fa-regular fa-pen-to-square"></i> Edit</a> <a
					href="../../delete?id=<%=b.getBookId()%>"
					class="btn btn-sm btn-danger"><i class="fa-solid fa-trash"></i>
						Delete</a></td>
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