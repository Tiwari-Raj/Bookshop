<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Order Successfully</title>
<%@include file="all-Component/all-css.jsp"%>
</head>
<body>
<c:if test="${empty userobj }">
		<c:redirect url="login.jsp">

		</c:redirect>
	</c:if>
	<%@include file="all-Component/navbar.jsp"%>
	
	<div class="container text-center mt-3 p-3">
	<i class="fa-regular fa-circle-check fa-5x text-success"></i>
	 <h1>Thank You</h1>
	<h2> Your Order successfully Placed </h2>
	
	<a href="index.jsp" class="btn btn-primary mt-3">Continue Shopping</a>
	</div>
	
	
<div class="p-5">
	<%@include file="all-Component/footer.jsp"%></div>
</body>
</html>