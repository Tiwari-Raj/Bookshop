<%@page import="java.util.List"%>
<%@page import="com.entity.Cart"%>
<%@page import="com.entity.User"%>
<%@page import="com.DB.DB_Connect"%>
<%@page import="com.DOA.CartDAOImpl"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page isELIgnored="false"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Cart Page</title>
<style>
.paint-card {
	box-shadow: 0 0 10px 0 rgba(0, 0, 0, 0.2);
}
</style>
<script>
	document.addEventListener("DOMContentLoaded", function() {
		// Get references to the select and div elements
		var selectPayment = document.querySelector("select[name='payment']");
		var form = document.querySelector("form[action='order']");
		var noSelectDiv = document.getElementById("noSelectMessage");
		var cashOnDeliveryDiv = document
				.getElementById("cashOnDeliveryMessage");
		var cardPaymentDiv = document.getElementById("cardPaymentForm");

		// Function to hide all divs
		function hideAllDivs() {
			noSelectDiv.style.display = "none";
			cashOnDeliveryDiv.style.display = "none";
			cardPaymentDiv.style.display = "none";
		}

		// Initial state: hide all divs
		hideAllDivs();

		// Event listener for the select element
		selectPayment.addEventListener("change", function() {
			var selectedOption = selectPayment.value;

			// Hide all divs first
			hideAllDivs();

			// Show the div corresponding to the selected option
			if (selectedOption === "noselect") {
				noSelectDiv.style.display = "block";
				
				form.action = "order";
				var inputfields=document.querySelectorAll(".cd");
				inputfields.forEach(function(field){field.required=false;});
			} else if (selectedOption === "COD") {
				var inputfields=document.querySelectorAll(".cd");
				inputfields.forEach(function(field){field.required=false;});
				cashOnDeliveryDiv.style.display = "block";
				form.action = "order";
				
			} else if (selectedOption === "CARD PAYMENT") {
				var inputfields=document.querySelectorAll(".cd");
				inputfields.forEach(function(field){field.required=true;});
				cardPaymentDiv.style.display = "block";
				form.action = "order";
			}
		});
	});
</script>


<%@include file="all-Component/all-css.jsp"%>
</head>
<body>
	<c:if test="${empty userobj }">
		<c:redirect url="login.jsp">

		</c:redirect>
	</c:if>
	<%@include file="all-Component/navbar.jsp"%>

	<c:if test="${empty userobj}">

		<c:redirect url="login.jsp"></c:redirect>

	</c:if>

	<c:if test="${not empty succMsg }">
		<div class="alert alert-primary" role="alert">${succMsg}</div>
		<c:remove var="succMsg" scope="session" />

	</c:if>

	<c:if test="${not empty failedMsg }">
		<div class="alert alert-primary" role="alert">${failedMsg }</div>

		<c:remove var="failedMsg" scope="session" />

	</c:if>




	<div class="container-fluid">
		<div class="row ml-4 mr-4 ">
			<div class="col-md-6 text-center border bg-white p-3 mt-4">

				<h3 class="text-center  text-primary">
					<i class="fa-solid fa-bag-shopping"></i> Your Selected Books
				</h3>
				<div class="card">
					<div class="card-body">

						<table class="table table-striped">
							<thead>
								<tr>
									<th scope="col">Book Name</th>
									<th scope="col">Price</th>
									<th scope="col">Action</th>
								</tr>
							</thead>
							<tbody>
								<%
								User u = (User) session.getAttribute("userobj");
								CartDAOImpl dao = new CartDAOImpl(DB_Connect.getConn());
								List<Cart> cart = dao.getBookByUser(u.getId());
								Double totalPrice = 0.00;

								for (Cart c : cart) {
									totalPrice = c.getTotalPrice();
								%>

								<tr>
									<th scope="row"><%=c.getBookName()%></th>
									<td><%=c.getPrice()%></td>
									<td><a
										href="remove_book?bid=<%=c.getBid()%>&&uid=<%=c.getUserId()%>"
										class="btn btn-danger"><i class="fa-solid fa-xmark"></i>
											Remove </a></td>
								</tr>



								<%
								}
								%>

								<tr>
									<td class=""><h4>Total Price</h4></td>

									<td></td>
									<td class="text-success"><h5>
											<i class="fa-solid fa-rupee-sign"></i>
											<%=totalPrice%></h5></td>
								</tr>


							</tbody>
						</table>
					</div>
				</div>
			</div>

			<div class="col-md-6 mt-4 mb-5">
				<div class="card">
					<div class="card-body">

						<h3 class="text-center  text-primary">Your Details</h3>

						<form action="order" method="post">

							<input type="hidden" value="${userobj.id}" name="id">

							<div class="form-row">
								<div class="form-group col-md-6">
									<label for="inputEmail4">Name</label> <input type="text"
										name="username" class="form-control" id="inputEmail4"
										value="<%=u.getName()%>" required>
								</div>
								<div class="form-group col-md-6">
									<label for="inputPassword4">Email</label> <input type="email"
										name="email" class="form-control" id="inputPassword4"
										value="<%=u.getEmail()%>" required>
								</div>
							</div>
							<div class="form-row">
								<div class="form-group col-md-6">
									<label for="inputEmail4">Mobile No</label> <input type="number"
										name="phno" class="form-control" id="inputEmail4"
										value="<%=u.getPhno()%>" required>
								</div>
								<div class="form-group col-md-6">
									<label for="inputPassword4">Address</label> <input type="text"
										name="address" class="form-control" id="inputPassword4"
										value="" required>
								</div>
							</div>
							<div class="form-row">
								<div class="form-group col-md-6">
									<label for="inputEmail4">Landmark</label> <input type="text"
										name="landmark" class="form-control" id="inputEmail4" value=""
										required>
								</div>
								<div class="form-group col-md-6">
									<label for="inputPassword4">City</label> <input type="text"
										name="city" class="form-control" id="inputPassword4" value=""
										required>
								</div>
							</div>
							<div class="form-row">
								<div class="form-group col-md-6">
									<label for="inputEmail4">State</label> <input type="text"
										name="state" class="form-control" id="inputEmail4" value=""
										required>
								</div>
								<div class="form-group col-md-6">
									<label for="inputPassword4">Pin Code</label> <input
										name="pincode" type="number" class="form-control"
										id="inputPassword4" value="" required>
								</div>
							</div>
							<div class="text-center">
								<h5>Select Payment Mode</h5>
							</div>


							<div class="form-group ">
								 <select class="form-control"
									name="payment">
									<option value="noselect" id="noselect">--Select--</option>
									
									<option value="CARD PAYMENT" 
										name="CARD PAYMENT">Card Payment</option>
										<option value="COD" >Cash On Delivery</option>
								</select>
							</div>



							<div id="noSelectMessage">
								<div class="container mt-2">
									<div class="row">
										<div class=" col-md-12">
											<div class="card paint-card">
												<div class="card-body">
												<h5>Please Select Payment Method</h5></div>
											</div>
										</div>
									</div>
								</div>
							</div>

							<%-- Cash on Delivery Message --%>
							<div id="cashOnDeliveryMessage">
								<div class="container mt-2">
									<div class="row">
										<div class=" col-md-12">
											<div class="card paint-card">
												<div class="card-body">
<div class="col-md-4">
									<h4>
										<img src="img/cod.jpg" style="height: 50px; width: 170px;">
										
									</h4>
								</div>
													<label>Name :
														&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</label><input
														type="text" name="username" value="<%=u.getName()%>"
														required><br>
													<div class="md-4 mt-3">
														<label>Mobile No. : &nbsp;&nbsp;&nbsp;</label><input
															type="number" name="phno" value="<%=u.getPhno()%>"
															required>
													</div>
													<br>
													<div class="md-4">
														<label>Email :
															&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</label><input
															type="email" name="email" value="<%=u.getEmail()%>"
															required>
													</div>

													<div class="md-4 mt-4 text-center">
														<h6>
															Total <i class="fa-solid fa-rupee-sign"></i>&nbsp;
															<%=totalPrice%></h6>
														<p>Payment will be collected in cash upon delivery.</p>
													</div>
													<br>
												</div>
											</div>
										</div>
									</div>
								</div>
							</div>
							<div id="cardPaymentForm">
								<div class="container mt-1">
									<div class="row">
										<div class="col-md-12">
										
											<div class="card paint-card">
												<div class="card-body">
												<div class="row">
								
								<div class="col-md-4">
									<h4>
										<img src="img/visa.png" style="height: 40px; width: 50px;">
										<img src="img/master.png" style="height: 40px; width: 50px;">
										<img src="img/Rupay.png" style="height: 40px; width: 50px;">
									</h4>
								</div>
							</div>
													<div class="md-4 mt-4"></div>
													<label for="cardNumber">Card Number:
														&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </label> <input
														type="text" id="cardNumber" name="cardNumber"
														placeholder="**** **** **** ****" class="cd" pattern="[4-8]\d{3}\d{4}\d{4}\d{4}"><br>
													<div class="md-4 mt-3">
														<label for="cardName">Cardholder Name:&nbsp;</label> <input
															type="text" id="cardName" class="cd"name="cardName" >
													</div>
													<br>
													<div class="md-4">
														<label for="expirationDate">Expiration Date
															:&nbsp;&nbsp;&nbsp;&nbsp;</label> <input type="text"
															id="expirationDate" class="cd"name="expirationDate"
															placeholder="MM/YY" pattern="(0[1-9]|1[0-2])/(2[2-9]|1[3-9]|[3-9]\d)">
													</div>
													<br>
													<div class="md-4">
														<label for="cvv">CVV:
															&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</label>
														<input type="text" id="cvv"class="cd" name="cvv" placeholder="***"
															pattern="[0-9]{2}[1-9]| [1-9]">
													</div>
													<br>
													<div class="md-4 mt-2 text-center">
														<h6>
															Total <i class="fa-solid fa-rupee-sign"></i>&nbsp;
															<%=totalPrice%></h6>
														<p>Payment will be deducted from your bank account.</p>
													</div>
												</div>
											</div>
										</div>
									</div>
								</div>
							</div>
							<div class="text-center mt-3">
								<button type="submit" class="btn btn-success">Order Now</button>
								<a href="index.jsp" class="btn btn-info"> Continue Shopping</a>
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

