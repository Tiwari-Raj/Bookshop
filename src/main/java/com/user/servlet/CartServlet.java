package com.user.servlet;

import javax.servlet.http.HttpServlet;
import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.DB.DB_Connect;
import com.DOA.BookDAOImpl;
import com.DOA.CartDAO;
import com.DOA.CartDAOImpl;
import com.entity.BookDtls;
import com.entity.Cart;
@WebServlet("/cart")
public class CartServlet extends HttpServlet{

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		try {
			int bid=Integer.parseInt(req.getParameter("bid"));
			int uid=Integer.parseInt(req.getParameter("uid"));
			
			BookDAOImpl dao = new BookDAOImpl(DB_Connect.getConn());
			BookDtls b=dao.getBookId(bid);
			
			Cart c= new Cart();
			c.setBid(bid);
			c.setUserId(uid);
			c.setBookName(b.getBookName());
			c.setPrice(Double.parseDouble(b.getPrice()));
			c.setTotalPrice(Double.parseDouble(b.getPrice()));
			
			CartDAOImpl dao2 =new CartDAOImpl(DB_Connect.getConn());
			boolean f=dao2.addCart(c);
			
			HttpSession session = req.getSession();
			
			if(f) {
				
				session.setAttribute("addCart", "Book added to cart..");
				resp.sendRedirect("checkout.jsp");
				
			}else {
				
				session.setAttribute("addCart", "Something went wrong!!");
				resp.sendRedirect("index.jsp");
			}
			
		} catch (Exception e) {
             e.printStackTrace();
		}
		
		
	}

	
	
	
}
