<%@page import="com.entity.User"%>
<%@page import="java.util.List"%>
<%@page import="com.entity.BookDtls"%>
<%@page import="com.DB.DB_Connect"%>
<%@page import="com.DOA.BookDAOImpl"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>search</title>
<%@include file="all-Component/all-css.jsp"%>

<style type="text/css">

.crd-ho:hover {
	background-color: #ddeff0;
}
</style>
</head>
<body>

<%
	User u = (User) session.getAttribute("userobj");
	%>


	<%@include file="all-Component/navbar.jsp"%>
	<div class="container-fluid">
		<div class="row">


				<%
				String ch=request.getParameter("ch");
				BookDAOImpl dao = new BookDAOImpl(DB_Connect.getConn());
				List<BookDtls> list = dao.getBookBySearch(ch);
				for (BookDtls b : list) {
				%>

				<div class="col-md-3">
					<div class="card crd-ho">
						<div class="card-body text-center">
							<img alt="" src="books/<%=b.getPhotoName()%>"
								style="width: 80px; height: 120px;" class="img-thumblin">
							<h6><%=b.getBookName()%></h6>
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
							
							
							
								<a href="view_book.jsp?bid=<%=b.getBookId()%>" class="btn btn-info btn-sm ml-1">View</a> <a href=""
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

</body>
</html>