package com.admin.servelet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.DB.DB_Connect;
import com.DOA.BookDAOImpl;
import com.entity.BookDtls;

@WebServlet("/editbooks")
public class EditBooksServlet extends HttpServlet {

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		try {
            int id=Integer.parseInt(req.getParameter("id"));
			String bookName = req.getParameter("bname");
			String price = req.getParameter("price");
			String status = req.getParameter("status");

			BookDtls b=new BookDtls();
			b.setBookId(id);
			b.setBookName(bookName);
			b.setPrice(price);
			b.setStatus(status);
			
			BookDAOImpl dao=new BookDAOImpl(DB_Connect.getConn());
			boolean f=dao.updateEditBooks(b);
			HttpSession session=req.getSession();
			
			
			if(f){
				
				session.setAttribute("succMsg", "Book Updated...");
				resp.sendRedirect("admin//all_books.jsp");
			}else {
				
				session.setAttribute("failedMsg", "Something went wrong!!!");
				resp.sendRedirect("admin//all_books.jsp");
				
			}
		
			
		} catch (Exception e) {
           e.printStackTrace();
		}

	}

}
