
<%@page import="com.entity.User"%>
<%@page import="com.DOA.UserDAOImpl"%>
<%@page import="org.apache.jasper.tagplugins.jstl.core.ForEach"%>
<%@page import="com.entity.BookDtls"%>
<%@page import="java.util.List"%>
<%@page import="com.DB.DB_Connect"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Admin All Users</title>
<%@include file="all-css.jsp"%>
</head>
<body>
<c:if test="${empty userobj }">
		<c:redirect url="login.jsp">

		</c:redirect>
	</c:if>
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
				<th scope="col">User ID</th>
				<th scope="col">User Name</th>
				<th scope="col">User Email</th>
				<th scope="col">User Phone number</th>
				<th scope="col">User Password</th>
				<th scope="col">Action</th>
			</tr>
		</thead>
		<tbody>

			<%
			UserDAOImpl dao = new UserDAOImpl(DB_Connect.getConn());
			List<User> list = dao.getalluser();

			for (User u : list) {
			%>

			<tr>
				<td><%=u.getId()%></td>
				<td><%=u.getName()%>"</td>
				<td><%=u.getEmail()%></td>
				<td><%=u.getPhno()%></td>
				<td><%=u.getPassword()%></td>
				

				<td> <a
					href="../../deleteuser?id=<%=u.getId()%>"
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

