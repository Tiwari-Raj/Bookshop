<%@page import="com.entity.User"%>
<%@page import="java.util.List"%>
<%@page import="com.entity.BookDtls"%>
<%@page import="com.DB.DB_Connect"%>
<%@page import="com.DOA.BookDAOImpl"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page isELIgnored="false"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>All Old Books</title>
<%@include file="all-Component/all-css.jsp"%>
<style type="text/css">
.crd-ho:hover {
	  background: linear-gradient(to top, #87CEEB, #fff); 
  color: #fff;
	
}
.productimg{
transition:ease 0.8s;
}
.productimg:hover {
	   transform:scale(1.2); /* Light blue to white gradient */
  color: #fff;
  
}
.crd-ho{
box-shadow: 0 0 10px 0 rgba(0, 0, 0, 0.3);
}
</style>
</head>
<body>


	<%
	User u = (User) session.getAttribute("userobj");
	%>

	<%@include file="all-Component/navbar.jsp"%>
	<h3 class="text-center text-dark"><i>All Old Books</i></h3>
	<div class="container-fluid">
		<div class="row ml-4">

			<%
			BookDAOImpl dao3 = new BookDAOImpl(DB_Connect.getConn());
			List<BookDtls> list3 = dao3.getAllOldbook();
			for (BookDtls b : list3) {
			%>
			<div class="col-md-3 mt-2">
				<div class="card border-secondary mb-3 crd-ho"
					style="max-width: 18rem;">

					<div class="card-body text-dark text-center">
						<img alt="" class="productimg" src="books/<%=b.getPhotoName()%>"
							style="width: 80px; height: 120px;" class="img-thumblin">
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
			<%
			}
			%>

		</div>
	</div>
<div class="p-3">
		<%@include file="all-Component/footer.jsp"%>
	</div>
</body>
</html>