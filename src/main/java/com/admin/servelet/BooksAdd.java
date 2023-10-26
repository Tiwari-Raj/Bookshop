package com.admin.servelet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

import com.DB.DB_Connect;
import com.DOA.BookDAOImpl;
import com.entity.BookDtls;
import com.google.protobuf.compiler.PluginProtos.CodeGeneratorResponse.File;

@WebServlet("/add_books")
@MultipartConfig
public class BooksAdd extends HttpServlet {

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		try {

			String bookName = req.getParameter("bname");
			String price = req.getParameter("price");
			String categories = req.getParameter("categories");
			String status = req.getParameter("status");
			Part part = req.getPart("bookimg");
			String fileName = part.getSubmittedFileName();

			BookDtls b = new BookDtls(bookName, price, categories, status, fileName, "admin");
			BookDAOImpl dao = new BookDAOImpl(DB_Connect.getConn());

			boolean f = dao.addBooks(b);
			HttpSession session = req.getSession();
			if (f){
              
				String path =getServletContext().getRealPath("")+"books";
				   
			    java.io.File file=new java.io.File(path);
			    
			    part.write(path+java.io.File.separator+fileName);
			    
				
				
				session.setAttribute("succMsg", "book Added Successfully");
				resp.sendRedirect("admin/add_books.jsp");
			} else {
				session.setAttribute("failedMsg", "Failed To Add Book");
				resp.sendRedirect("admin/add_books.jsp");
			}

		} catch (Exception e) {
			e.printStackTrace();
		}

	}

}
