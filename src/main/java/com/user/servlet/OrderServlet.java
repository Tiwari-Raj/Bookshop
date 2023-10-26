package com.user.servlet;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.DB.DB_Connect;
import com.DOA.BookOrderDAOImpl;
import com.DOA.CartDAOImpl;
import com.entity.Book_Order;
import com.entity.Cart;

@WebServlet("/order")
public class OrderServlet extends HttpServlet {

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		try {
			
			HttpSession session=req.getSession();
			
			int id = Integer.parseInt(req.getParameter("id"));
			String name = req.getParameter("username");
			String email = req.getParameter("email");
			String phno = req.getParameter("phno");
			String address = req.getParameter("address");
			String landmark = req.getParameter("landmark");
			String city = req.getParameter("city");
			String state = req.getParameter("state");
			String pincode = req.getParameter("pincode");
			String paymentType = req.getParameter("payment");

			String fullAdd = address + "," + landmark + "," + city + "," + state + "," + pincode;

			CartDAOImpl dao = new CartDAOImpl(DB_Connect.getConn());

			List<Cart> blist = dao.getBookByUser(id);

			if(blist.isEmpty()) {
				session.setAttribute("failedMsg", "Please Add Book ");
				resp.sendRedirect("checkout.jsp");
				
			}else {
				
				BookOrderDAOImpl dao2 = new BookOrderDAOImpl(DB_Connect.getConn());
				int i = dao2.getOrderNo();
				Book_Order o = new Book_Order();
				ArrayList<Book_Order> orderList = new ArrayList<Book_Order>();

				for (Cart c : blist) {

					o.setOrderId("BOOK-ORD-00"+i);
					o.setUserName(name);
					o.setEmail(email);
					o.setPhno(phno);
					o.setFulladd(fullAdd);
					o.setBookName(c.getBookName());
					o.setPrice(c.getPrice()+"");
					o.setPaymentType(paymentType);
					orderList.add(o);
					i++;
				}

				if ("noselect".equals(paymentType)) {
					
					session.setAttribute("failedMsg", "Please Choose Payment Method ");
					resp.sendRedirect("checkout.jsp");
				}
				
				else {

					Boolean f = dao2.saveOrder(orderList);
					if(f) {
					  if("CARD PAYMENT".equals(paymentType)) {
						  req.getRequestDispatcher("/emailsending").forward(req, resp);
						}
					  else if("COD".equals(paymentType)){
						req.getRequestDispatcher("/emailsending").forward(req, resp);
					  }
					}else {
						session.setAttribute("failedMsg", "Something went wrong ");
						resp.sendRedirect("checkout.jsp");
					}
				}
			}

		} catch (Exception e) {
			e.printStackTrace();
		}

	}

}
