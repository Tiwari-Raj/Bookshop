<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page isELIgnored="false"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>setting</title>
<style type="text/css">
.crd-ho:hover {
	background: linear-gradient(to top, #87CEEB, #fff);
	color: black;
}

.crd-ho {
	box-shadow: 0 0 10px 0 rgba(0, 0, 0, 0.3);
}
</style>
<%@include file="all-Component/all-css.jsp"%>
</head>
<body>
<%@include file="all-Component/navbar.jsp"%>

<h4 class="text-center pt-2">

		<b><i class="fa-solid fa-user"></i> Hello ${userobj.name }</b>
	</h4>
	<div class="container mt-2">
		<div class="row p-5">

			<div class="col-md-4 ">
				<a href="Edit_profile.jsp" class="text-dark">
					<div class="card border-secondary mb-3 crd-ho"
						style="max-width: 18rem;">
						<div class="card-body text-center">
							<i class="fa-regular fa-pen-to-square fa-5x text-primary"></i><br><br>
							<h4> Edit Profile </h4>
							
						</div>
					</div>
				</a>
			</div>

			

			<div class="col-md-4">
				<a href="user_order.jsp" class="text-dark">
					<div class="card border-secondary mb-3 crd-ho"
						style="max-width: 18rem;">
						<div class="card-body text-center">
							<i class="fa-solid fa-box text-warning fa-5x"></i></i><br><br>
							<h4>My Order</h4>
							
						</div>
					</div>
				</a>
			</div>

			<div class="col-md-4">
				<a href="Helpline.jsp" class="text-dark">
					<div class="card border-secondary mb-3 crd-ho"
						style="max-width: 18rem;">
						<div class="card-body text-center">
							<i class="fa-solid fa-circle-user fa-5x text-dark"></i><br><br>
							<h4>Help Center</h4>
							
						</div>
					</div>
				</a>
			</div>
		</div>
	</div>




<div class="p-5">
	<%@include file="all-Component/footer.jsp"%></div>
</body>
</html>