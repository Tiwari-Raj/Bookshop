<%@page import="com.entity.BookDtls"%>
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
<title>Admin edit book</title>
<%@include file="all-css.jsp"%>
</head>
<body style="background-color: #fcf7f7;">
<c:if test="${empty userobj }">
		<c:redirect url="login.jsp">

		</c:redirect>
	</c:if>
	<%@include file="navbar.jsp"%>
	<h4 class="text-center p-2">Edit Book</h4>






	<div class="container">
		<div class="row p-3">
			<div class="col-md-4 offset-md-4">
				<div class="card">
					<div class="card-body">

						
						<%
						int id = Integer.parseInt(request.getParameter("id"));
						BookDAOImpl dao = new BookDAOImpl(DB_Connect.getConn());
						BookDtls b = dao.getBookId(id);
						%>




						<form action="../../editbooks" method="post">
                            
                            <input type="hidden" name="id" value="<%=b.getBookId() %>">
                            
							<div class="form-group">
								<label for="exampleInputEmail1" class="form-label"> Book
									Name*</label> <input name="bname" type="text" class="form-control"
									id="exampleInputEmail1" aria-describedby="emailHelp"
									value="<%=b.getBookName()%>">

							</div>
							<div class="form-group">
								<label for="exampleInputPassword1" class="form-label">Price*</label>
								<input type="number" name="price" class="form-control"
									id="exampleInputEmail1" aria-describedby="emailHelp"
									value="<%=b.getPrice()%>">

							</div>


							<div class="form-group">
								<label for="inputState">Book Status</label> <select
									id="inputState" name="status" class="form-control">
									<%
									if ("Active".equals(b.getStatus())) {
									%>
									<option value="New">Active</option>
									<option value="New">Inactive</option>
									<%
									} else {
									%>
									<option value="New">Inactive</option>
									<option value="New">Active</option>
									<%
									}
									%>


								</select>
							</div>




							<button type="submit" class="btn btn-success offset-md-5">Update</button>
						</form>


					</div>
				</div>
			</div>
		</div>
	</div>

<div class="p-5">
	<%@include file="footer.jsp"%></div>


</body>
</html>