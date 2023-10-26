<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Deals</title>
<style type="text/css">

.crd-ho:hover {
	  background: linear-gradient(to top, #87CEEB, #fff); 
  color: #fff;
	
}
.crd-ho{
box-shadow: 0 0 10px 0 rgba(0, 0, 0, 0.3);
}
</style>
<%@include file="all-Component/all-css.jsp"%>
</head>
<body>
	<%@include file="all-Component/navbar.jsp"%>
	<h3 class="text-center text-dark"><i>Today's Deal</i></h3><hr>
	<h3 class="text-danger ml-4"><b><i class="fa-solid fa-tags text-danger"></i> Upto 50% Off</b></h3>
	<div class="container-fluid">
		<div class="row ml-4">
			<div class="col-md-3 mt-2">
				<div class="card border-secondary mb-3 crd-ho"
					style="max-width: 18rem;">

					<div class="card-body text-secondary text-center">
						<img class="card-img-top" src="img/ai.jpg" alt="Card image cap">
						<h5 class="card-title">
							<b>AI Tools</b>
						</h5>
						<div class="row">
							<h5>
								&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Rs.300 &nbsp;
								<del class="text-danger">Rs.530</del>
							</h5>
						</div>

						<a href="all_recent_book.jsp" class="btn btn-secondary">Buy Now</a>

					</div>
				</div>
			</div>
			
			<div class="col-md-3 mt-2">
				<div class="card border-secondary mb-3 crd-ho"
					style="max-width: 18rem;">

					<div class="card-body text-secondary text-center">
						<img class="card-img-top" src="img/ad_css.jpg" height="318px" alt="Card image cap">
						<h5 class="card-title">
							<b>Modern CSS</b>
						</h5>
						<div class="row">
							<h5>
								&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Rs.250 &nbsp;
								<del class="text-danger">Rs.430</del>
							</h5>
						</div>

						<a href="all_recent_book.jsp" class="btn btn-secondary">Buy Now</a>

					</div>
				</div>
			</div>
		</div>
	</div>


	<div class="p-4">
		<%@include file="all-Component/footer.jsp"%>
	</div>
</body>
</html>