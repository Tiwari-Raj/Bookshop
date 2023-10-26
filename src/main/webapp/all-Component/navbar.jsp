<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page isELIgnored="false"%>

<div class="container-fluid p-3">
	<div class="row">
		<div class="col-md-3">
			<h3>
				<img src="img/logo.png" style="height:40px; width:50px;"> Book Store
			</h3>
		</div>
		<div class="col-md-6 ">
			<form class="form-inline my-2 my-lg-0" action="search.jsp" method="post">
				<input class="form-control mr-sm-2 " type="search" name="ch"
					placeholder="Search" aria-label="Search">
				<button class="btn btn-dark my-2 my-sm-0" type="submit">Search</button>
			</form>

		</div>

		<c:if test="${not empty userobj}">
			<a href="checkout.jsp"><i
				class="fa-solid fa-cart-shopping fa-2x pt-1 pr-2 text-primary"></i>
			</a>
			<div class="row-md-3">

				<a href="login.jsp" class="btn btn-success"><i
					class="fa-solid fa-user"></i> ${userobj.name }</a> <a href="logout"
					class="btn btn-secondary"><i
					class="fa-solid fa-right-from-bracket"></i> Logout</a>
			</div>

		</c:if>
		<c:if test="${ empty userobj}">

			<div class="row-md-2">
				<a href="login.jsp" class="btn btn-success"><i
					class="fa-solid fa-user-plus"></i>Login</a> <a href="register.jsp"
					class="btn btn-dark"><i class="fa-regular fa-id-card"></i>
					Register</a>
			</div>


		</c:if>
	</div>
</div>
<nav class="navbar navbar-expand-lg navbar-dark bg-custom lm-0.5">

	<button class="navbar-toggler" type="button" data-toggle="collapse"
		data-target="#navbarSupportedContent"
		aria-controls="navbarSupportedContent" aria-expanded="false"
		aria-label="Toggle navigation">
		<span class="navbar-toggler-icon"></span>
	</button>

	<div class="collapse navbar-collapse" id="navbarSupportedContent">
		<ul class="navbar-nav mr-auto">
			<li class="nav-item active"><a class="nav-link" href="index.jsp">
					<i class="fa-solid fa-house-chimney"></i> Home <span
					class="sr-only">(current)</span>
			</a></li>

			<li class="nav-item active"><a class="nav-link disabled"
				href="all_recent_book.jsp"><i class="fa-solid fa-book"></i>
					Recent Book</a></li>
			<li class="nav-item active"><a class="nav-link"
				href="all_new_book.jsp"><i class="fa-solid fa-book"></i> New
					Book</a></li>

			<li class="nav-item active"><a class="nav-link disabled"
				href="all_old_book.jsp"><i class="fa-solid fa-book"></i> Old
					Book</a></li>
		</ul>
		<form class="form-inline my-2 mlmy-lg-0">

			
			<a href="setting.jsp" style="height:40px;"class="btn btn-light my-2 my-sm-0 mr-1" type="submit">
				<i class="fa-solid fa-gear "></i>  Setting
			</a>
			<a href="chatbot.jsp"  class="btn btn-light my-2 my-sm-0 ml-1" type="submit"><img src="img/bot.png" height="25px" width="35px"> Chat
			</a>
		</form>
	</div>
</nav>