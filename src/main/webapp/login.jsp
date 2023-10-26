<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Login Page</title>
<%@include file="all-Component/all-css.jsp"%>
</head>
<body style="background-color: #e8eded;">
	<%@include file="all-Component/navbar.jsp"%>

	<div class="container p-5">
		<div class="row">
			<div class="mx-auto col-10 col-md-8 col-lg-6">
				<div class="card">
					<div class="card-body">

						<h4 class="text-center">Login Page</h4>

						<c:if test="${not empty failedMsg }">

							<p class="text-center text-danger">${failedMsg}</p>
							<c:remove var="failedMsg" scope="session" />

						</c:if>
                         
                         <c:if test="${not empty succMsg }">

							<p class="text-center text-success">${succMsg}</p>
							<c:remove var="succMsg" scope="session" />

						</c:if>
                         
                         
						<form action="Login" method="post">
							<div class="mb-3">
								<label for="exampleInputEmail1" class="form-label">Email
									address</label> <input type="email" class="form-control"
									id="exampleInputEmail1" aria-describedby="emailHelp"
									required="required" name="email">

							</div>
							<div class="mb-3">
								<label for="exampleInputPassword1" class="form-label">Password</label>
								<input type="password" class="form-control"
									id="exampleInputPassword1" required="required" name="password">
									
									<p style="font-size:14px;"><i><a href="forgot_Password.jsp">Forgot Password?</a></i></p>
							</div>

							<div class="text-center">
								<button type="submit" class="btn btn-primary">Login</button>
								<br> <a href="register.jsp"><b></b><i>Create
										Account<i><b></b></i></a>
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