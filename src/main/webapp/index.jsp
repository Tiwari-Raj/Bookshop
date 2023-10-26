
<%@page import="com.entity.User"%>
<%@page import="com.entity.BookDtls"%>
<%@page import="java.util.List"%>
<%@page import="com.DOA.BookDAOImpl"%>
<%@page import="java.sql.Connection"%>
<%@page import="com.DB.DB_Connect"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page isELIgnored="false"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Book Index Page</title>
<%@include file="all-Component/all-css.jsp"%>
<style type="text/css">
.crd-ho:hover {
	background: linear-gradient(to top, #87CEEB, #fff);
	/* Light blue to white gradient */
	color: #fff;
}

.productimg {
	transition: ease 0.8s;
}

.productimg:hover {
	transform: scale(1.2); /* Light blue to white gradient */
	color: #fff;
}

.crd-ho {
	box-shadow: 0 0 10px 0 rgba(0, 0, 0, 0.3);
}

.crd-hr {
	box-shadow: 0 0 10px 0 rgba(0, 5, 1, 0.5);
}

.award {
	height: 80px;
	width: 80px;
}
</style>
</head>
<body style="background-color: #fcfcfc;">

	<%
	User u = (User) session.getAttribute("userobj");
	%>

	<%@include file="all-Component/navbar.jsp"%>


	<div id="carouselExampleIndicators" class="carousel slide"
		data-ride="carousel">
		<ol class="carousel-indicators">
			<li data-target="#carouselExampleIndicators" data-slide-to="0"
				class="active"></li>
			<li data-target="#carouselExampleIndicators" data-slide-to="1"></li>
			<li data-target="#carouselExampleIndicators" data-slide-to="2"></li>
		</ol>
		<div class="carousel-inner">
			<div class="carousel-item active">
				<img class="d-block w-100" src="img/y1.jpg" height="500px"
					alt="First slide">
			</div>
			<div class="carousel-item">
				<img class="d-block w-100" src="img/y2.jpg" height="500px"
					alt="Second slide">
			</div>
			<div class="carousel-item">
				<img class="d-block w-100" src="img/y3.png" height="500px"
					alt="Third slide">
			</div>
		</div>
		<a class="carousel-control-prev" href="#carouselExampleIndicators"
			role="button" data-slide="prev"> <span
			class="carousel-control-prev-icon" aria-hidden="true"></span> <span
			class="sr-only">Previous</span>
		</a> <a class="carousel-control-next" href="#carouselExampleIndicators"
			role="button" data-slide="next"> <span
			class="carousel-control-next-icon" aria-hidden="true"></span> <span
			class="sr-only">Next</span>
		</a>
	</div>
	<!--  -->
	<div class="text-dark crd-hr">
		<hr>
	</div>
	<div class="container-fluid mt-4">
		<div class="row">
			<div class="col-md-3 ">

				<div class="text-center">
					<p>
						<a href="best_seller.jsp"> <i
							class="fa-solid fa-award fa-3x text-dark"></i></a>
					</p>
					<h4>
						<i>Best Seller</i>
					</h4>
				</div>
			</div>
			<div class="col-md-3">
				<div class="text-center">
					<p>
						<a href="award.jsp"> <i
							class="fa-solid fa-trophy fa-3x text-dark"></i></a>
					</p>
					<h4>
						<i>Award Winner</i>
					</h4>
				</div>
			</div>
			<div class="col-md-3">
				<div class="text-center">
					<p>
						<a href="box_set.jsp"> <i
							class="fa-solid fa-box-open fa-3x text-dark"></i></a>
					</p>
					<h4>
						<i>Box Sets</i>
					</h4>
				</div>
			</div>
			<div class="col-md-3">
				<div class="text-center ">
					<p>
						<a href="deal.jsp"> <img src="img/24.png"
							style="height: 55px; width: 50px; opacity: 0.78;"></a>
					</p>
					<h4>
						<i>Today's deal</i>
					</h4>
				</div>
			</div>

		</div>
	</div>

	<!--  -->
	<!-- Starting of recent book -->
	<div class="text-dark crd-hr">
		<hr>
	</div>
	<div class="container-fluid mt-4" style="background-color: #fcfcfc;">
		<h3 class="text-center">Recent Book</h3>
		<div class="row ml-4">

			<%
			BookDAOImpl dao = new BookDAOImpl(DB_Connect.getConn());
			List<BookDtls> list = dao.getRecentBooks();
			for (BookDtls b : list) {
			%>
			<a href="view_book.jsp?bid=<%=b.getBookId()%>" class="text-dark"><div
					class="col-md-3 mt-2">
					<div class="card border-secondary mb-3 crd-ho"
						style="max-width: 18rem;">

						<div class="card-body text-dark text-center">
							<img class="productimg" alt="" src="books/<%=b.getPhotoName()%>"
								style="width: 130px; height: 175px;" class="img-thumblin">
							<h6 class="mt-4"><%=b.getBookName()%></h6>
							<h6>
								Categories :
								<%=b.getBookCategory()%></h6>
							<div class="row-ml-5">



								<%
								if (u == null) {
								%>

								<a href="login.jsp" class="btn btn-secondary btn-sm ml-3"><i
									class="fa-solid fa-cart-shopping"></i>Add Cart</a>

								<%
								} else {
								%>

								<a href="cart?bid=<%=b.getBookId()%>&&uid=<%=u.getId()%>"
									class="btn btn-secondary btn-sm ml-3"><i
									class="fa-solid fa-cart-shopping"></i>Add Cart</a>

								<%
								}
								%>



								<a href="view_book.jsp?bid=<%=b.getBookId()%>"
									class="btn btn-info btn-sm ml-1">View</a> <a href=""
									class="btn btn-success btn-sm ml-1"><i
									class="fa-solid fa-rupee-sign"></i>.<%=b.getPrice()%></a>
							</div>

						</div>
					</div>
				</div> </a>
			<%
			}
			%>
		</div>
		<div class="text-center ml-1 p-3">
			<a href="all_recent_book.jsp"
				class="btn btn-primary btn-sm text-white">View All</a>
		</div>
	</div>
	<hr>
	<!-- Ending of recent book -->



	<!-- Starting of New book -->
	<div class="container-fluid" style="background-color: #fcfcfc;">
		<h3 class="text-center">New book</h3>
		<hr>
		<div class="row ml-4">

			<%
			BookDAOImpl dao2 = new BookDAOImpl(DB_Connect.getConn());
			List<BookDtls> list2 = dao2.getNewBook();
			for (BookDtls b : list2) {
			%>
			<a href="view_book.jsp?bid=<%=b.getBookId()%>" class="text-dark">
				<div class="col-md-3 mt-2">
					<div class="card border-secondary mb-3 crd-ho"
						style="max-width: 18rem;">

						<div class="card-body text-dark text-center">
							<img alt="" class="productimg" src="books/<%=b.getPhotoName()%>"
								style="width: 130px; height: 175px;" class="img-thumblin">
							<h6 class="mt-4"><%=b.getBookName()%></h6>
							<h6>
								Categories :<%=b.getBookCategory()%></h6>
							<div class="row-ml-5">

								<%
								if (u == null) {
								%>

								<a href="login.jsp" class="btn btn-secondary btn-sm ml-3"><i
									class="fa-solid fa-cart-shopping"></i>Add Cart</a>

								<%
								} else {
								%>

								<a href="cart?bid=<%=b.getBookId()%>&&uid=<%=u.getId()%>"
									class="btn btn-secondary btn-sm ml-3"><i
									class="fa-solid fa-cart-shopping"></i>Add Cart</a>

								<%
								}
								%>


								<a href="view_book.jsp?bid=<%=b.getBookId()%>"
									class="btn btn-info btn-sm ml-1">View</a> <a href=""
									class="btn btn-success btn-sm ml-1"><i
									class="fa-solid fa-rupee-sign"></i><%=b.getPrice()%></a>
							</div>
						</div>
					</div>
				</div>
			</a>
			<%
			}
			%>
		</div>
		<div class="text-center ml-1 p-3">
			<a href="all_new_book.jsp" class="btn btn-primary btn-sm text-white">View
				All</a>
		</div>
	</div>
	<hr>
	<!-- Ending of New book -->



	<!-- Starting of Old book -->

	<div class="container-fluid" style="background-color: #fcfcfc;">
		<h3 class="text-center">Old book</h3>
		<hr>
		<div class="row ml-4">

			<%
			BookDAOImpl dao3 = new BookDAOImpl(DB_Connect.getConn());
			List<BookDtls> list3 = dao3.getOldBooks();
			for (BookDtls b : list3) {
			%>
			<a href="view_book.jsp?bid=<%=b.getBookId()%>" class="text-dark">
				<div class="col-md-3 mt-2">
					<div class="card border-secondary mb-3 crd-ho"
						style="max-width: 18rem;">

						<div class="card-body text-dark text-center">
							<img alt="" class="productimg" src="books/<%=b.getPhotoName()%>"
								style="width: 130px; height: 175px;" class="img-thumblin">
							<h6 class="mt-4"><%=b.getBookName()%></h6>
							<h6>
								Categories :
								<%=b.getBookCategory()%></h6>
							<div class="row-ml-5">


								<%
								if (u == null) {
								%>

								<a href="login.jsp" class="btn btn-secondary btn-sm ml-3"><i
									class="fa-solid fa-cart-shopping"></i>Add Cart</a>

								<%
								} else {
								%>

								<a href="cart?bid=<%=b.getBookId()%>&&uid=<%=u.getId()%>"
									class="btn btn-secondary btn-sm ml-3"><i
									class="fa-solid fa-cart-shopping"></i>Add Cart</a>

								<%
								}
								%>


								<a href="view_book.jsp?bid=<%=b.getBookId()%>"
									class="btn btn-info btn-sm ml-1">View</a> <a href=""
									class="btn btn-success btn-sm ml-1"><i
									class="fa-solid fa-rupee-sign"></i>.<%=b.getPrice()%></a>
							</div>
						</div>
					</div>
				</div>
			</a>
			<%
			}
			%>
		</div>
		<div class="text-center ml-1 p-3 mb-4">
			<a href="all_old_book.jsp" class="btn btn-primary btn-sm text-white">View
				All</a>
		</div>
	</div>
	<hr>

	<!-- Ending of Old book -->
	<div class="p-3">
		<%@include file="all-Component/footer.jsp"%>
	</div>
</body>
</html>