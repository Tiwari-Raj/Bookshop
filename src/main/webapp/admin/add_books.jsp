<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Admin add book</title>
<%@include file="all-css.jsp"%>
</head>
<body style="background-color: #fcf7f7;">
	<%@include file="navbar.jsp"%>

	<c:if test="${empty userobj }">
		<c:redirect url="../login.jsp">

		</c:redirect>
	</c:if>

	<h4 class="text-center p-2">Add Book</h4>


	<c:if test="${not empty succMsg }">
		<p class="text-center text-success">${succMsg}</p>
		<c:remove var="succMsg" scope="session" />
	</c:if>

	<c:if test="${not empty failedMsg }">
		<p class="text-center text-danger">${failedMsg}</p>
		<c:remove var="failedMsg" scope="session" />
	</c:if>






	<div class="container">
		<div class="row p-3">
			<div class="col-md-4 offset-md-4">
				<div class="card">
					<div class="card-body">

						<form action="${pageContext.request.contextPath}/add_books " method="post"
							enctype="multipart/form-data">

							<div class="form-group">
								<label for="exampleInputEmail1" class="form-label"> Book
									Name*</label> <input name="bname" type="text" class="form-control"
									id="exampleInputEmail1" aria-describedby="emailHelp"
									required="required">

							</div>
							<div class="form-group">
								<label for="exampleInputPassword1" class="form-label">Price*</label>
								<input type="number" name="price" class="form-control"
									id="exampleInputEmail1" aria-describedby="emailHelp"
									required="required">

							</div>
							<div class="form-group">
								<label for="inputState">Book Categories</label> <select
									id="inputState" name="categories" class="form-control">
									<option selected>--select--</option>
									<option value="Recent">Recent Book</option>
									<option value="New">New Book</option>
									<option value="Old">Old Book</option>
								</select>
							</div>

							<div class="form-group">
								<label for="inputState">Book Status</label> <select
									id="inputState" name="status" class="form-control">
									<option selected>--select--</option>
									<option value="Active">Active</option>
									<option value="Inactive">Inactive</option>
								</select>
							</div>


							<div class="form-group">
								<label for="exampleFormControlFile1">Upload Book </label> <input
									type="file" name="bookimg" class="form-control-file"
									id="exampleFormControlFile1">

							</div>


							<button type="submit" class="btn btn-success offset-md-5">Add</button>
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