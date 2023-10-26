<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>best seller</title>

<%@include file="all-Component/all-css.jsp"%>
</head>
<body>
	<%@include file="all-Component/navbar.jsp"%>
	<h3 class="text-center text-dark"><i>Best Seller</i></h3><hr>
	<div class="container-fluid">
		<div class="row p-4">
			<div class="col-md-3 ">
				<div class="card " style="width: 18rem;">
					<img class="card-img-top mt-2" src="img/seller1.jpg"
						alt="Card image cap">
					<div class="card-body text-center">
						<h5 class="card-text text-danger">Unavailable*</h5>
					</div>
				</div>
			</div>

			<div class="col-md-8">

				<p>Cracking the Coding Interview, 6th Edition is here to help
					you through this process, teaching you what you need to know and
					enabling you to perform at your very best. I've coached and
					interviewed hundreds of software engineers. The result is this
					book.</p>
				<p>Learn how to uncover the hints and hidden details in a
					question, discover how to break down a problem into manageable
					chunks, develop techniques to unstick yourself when stuck, learn
					(or re-learn) core computer science concepts, and practice on 189
					interview questions and solutions.</p>
			</div>


		</div>
	</div>
	<hr>

	<div class="container-fluid">
		<div class="row p-4">
			<div class="col-md-3 ">
				<div class="card" style="width: 18rem;">
					<img class="card-img-top mt-2" src="img/seller2.jpg"
						 alt="Card image cap">
					<div class="card-body text-center">
						<h5 class="card-text text-danger">Unavailable*</h5>
					</div>
				</div>
			</div>

			<div class="col-md-8">

				<p>This book can be seen as a sequel to the book: System Design
					Interview - An Insider's Guide. It covers a different set of system
					design interview questions and solutions. Although reading Volume 1
					is helpful, it is not required. This book should be accessible to
					readers who have a basic understanding of distributed systems.</p>
				<p>What's inside?<br>
- An insider's take on what interviewers really look for and why.<br>
- A 4-step framework for solving any system design interview question.<br>
- 13 real system design interview questions with detailed solutions.<br>
- 300+ diagrams to visually explain how different systems work.</p>
			</div>


		</div>
	</div>
	<hr>

	<div class="p-5">
	<%@include file="all-Component/footer.jsp"%></div>
</body>
</html>