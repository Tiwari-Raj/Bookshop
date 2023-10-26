<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Admin: Home</title>
<%@include file="all-css.jsp"%>
<style type="text/css">
.crd-ho:hover {
	background: linear-gradient(to top, #87CEEB, #fff);
	color: black;
}

.crd-ho {
	box-shadow: 0 0 10px 0 rgba(0, 0, 0, 0.3);
}
</style>
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
	<div class="container mt-10">
		<div class="row p-5">

			<div class="col-md-3">
				<a href="add_books.jsp" class="text-dark">
					<div class="card border-secondary mb-3 crd-ho"
						style="max-width: 18rem;">
						<div class="card-body text-center">
							<i class="fa-regular fa-square-plus fa-5x text-success"></i><br>
							<h4>Add Books</h4>
							---------
						</div>
					</div>
				</a>
			</div>

			<div class="col-md-3">
				<a href="all_books.jsp " class="text-dark">
					<div class="card border-secondary mb-3 crd-ho"
						style="max-width: 18rem;">
						<div class="card-body text-center">
							<i class="fa-solid fa-book-open fa-5x text-warning"></i><br>
							<h4>All Books</h4>
							---------
						</div>
					</div>
				</a>
			</div>

			<div class="col-md-3">
				<a href="orders.jsp" class="text-dark">
					<div class="card border-secondary mb-3 crd-ho"
						style="max-width: 18rem;">
						<div class="card-body text-center">
							<i class="fa-solid fa-people-carry-box fa-5x text-danger"></i><br>
							<h4>Order</h4>
							---------
						</div>
					</div>
				</a>
			</div>

			<div class="col-md-3">
				<a href="all_user.jsp"class="text-dark">
					<div class="card border-secondary mb-3 crd-ho"
						style="max-width: 18rem;">
						<div class="card-body text-center">
							<i class="fa-solid fa-user fa-5x text-secondary"></i><br>
							<h4 class="text-dark">All User</h4>
							---------
						</div>
					</div>
				</a>
			</div>
		</div>
	</div>
	<!-- Start Log Out Model -->

	<!-- Modal -->
	<div class="modal fade" id="exampleModal" tabindex="-1" role="dialog"
		aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="exampleModalLabel"></h5>
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<div class="modal-body">
					<div class="text-center">
						<h5>Do you want to logout..?</h5>
						<br> <br>
						<button type="button" class="btn btn-secondary"
							data-dismiss="modal">Close</button>
						<a href="../../logout" type="button"
							class="btn btn-primary text-white">Logout</a>

					</div>

				</div>
				<div class="modal-footer"></div>
			</div>
		</div>
	</div>

	<!-- End Log Out Model -->

<div class="p-5">
	<%@include file="footer.jsp"%></div>

</body>
</html>