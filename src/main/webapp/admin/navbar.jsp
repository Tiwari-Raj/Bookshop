<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page isELIgnored="false"%>

<div class="container-fluid p-3">
	<div class="row">
		<div class="col-md-10">
			<h3>
				<i class="fa-solid fa-book"></i> Book Store
			</h3>
		</div>

		<div class="col-md-2">
			<c:if test="${not empty userobj }">
				<a  class="btn btn-success text-white"><i
					class="fa-solid fa-user"></i> ${userobj.name }</a>
				<a data-toggle="modal" data-target="#exampleModal"
					class="btn btn-secondary"><i
					class="fa-solid fa-right-from-bracket"></i> Logout</a>
			</c:if>

			<c:if test="${empty userobj }">
				<a href="../login.jsp" class="btn btn-success"><i
					class="fa-solid fa-user-plus"></i>Login</a>
				<a href="../register.jsp" class="btn btn-secondary"><i
					class="fa-regular fa-id-card"></i> Register</a>
			</c:if>

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
				<h5 class="modal-title" id="exampleModalLabel">
				</h5>
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
					<a href="../../logout" type="button" class="btn btn-primary text-white">Logout</a>

				</div>

			</div>
			<div class="modal-footer"></div>
		</div>
	</div>
</div>

<!-- End Log Out Model -->

<nav class="navbar navbar-expand-lg navbar-dark bg-custom lm-0.5">

	<button class="navbar-toggler" type="button" data-toggle="collapse"
		data-target="#navbarSupportedContent"
		aria-controls="navbarSupportedContent" aria-expanded="false"
		aria-label="Toggle navigation">
		<span class="navbar-toggler-icon"></span>
	</button>

	<div class="collapse navbar-collapse" id="navbarSupportedContent">
		<ul class="navbar-nav mr-auto">
			<li class="nav-item active"><a class="nav-link" href="home.jsp">
					<i class="fa-solid fa-house-chimney"></i> Home <span
					class="sr-only">(current)</span>
			</a></li>

			</form>
	</div>
</nav>