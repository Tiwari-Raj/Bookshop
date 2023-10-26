<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Forgot password</title>
<%@include file="all-Component/all-css.jsp"%>
</head>
<body>

	<%@include file="all-Component/navbar.jsp"%>


	<div class="container p-2">
		<div class="row">
			<div class="col-md-4 offset-md-4">
				<div class="card">
					<div class="card-body">

						<h4 class="text-center text-dark">Password Update</h4>
						
						
						<c:if test="${not empty failedMsg }">

							<p class="text-center text-danger">${failedMsg}</p>
							<c:remove var="failedMsg" scope="session" />

						</c:if>
                         
                         <c:if test="${not empty succMsg }">

							<p class="text-center text-success">${succMsg}</p>
							<c:remove var="succMsg" scope="session" />

						</c:if>
						
						
						<form action="" method="post">

							
							<div class="mb-3">
								<label for="exampleInputEmail1" class="form-label">Email
									address*</label> <input type="email" class="form-control"
									id="exampleInputEmail1" aria-describedby="emailHelp"
									required="required" name="email">

							</div>

							<div class="mb-3">
								<label for="exampleInputEmail1" class="form-label">Phone
									No*</label> <input type="number" class="form-control"
									id="exampleInputEmail1" aria-describedby="emailHelp"
									required="required" name="phno">

							</div>

							<div class="mb-3">
								<label for="exampleInputPassword1" class="form-label">Enter New Password</label>
								<input type="password" class="form-control"
									id="exampleInputPassword1" required="required" name="password">
							</div>
							<div class="text-center">
								<button type="submit" class="btn btn-primary ">Update</button>
							</div>
						</form>






					</div>
				</div>




			</div>
		</div>
	</div>






	<div class="p-5">
	<%@include file="all-Component/footer.jsp"%></div>
</body>
</html>