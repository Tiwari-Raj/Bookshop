package com.user.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.swing.text.StyledEditorKit.BoldAction;

import com.DB.DB_Connect;
import com.DOA.UserDAOImpl;
import com.entity.User;

@WebServlet("/register")
public class RegisterServelet extends HttpServlet {

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		try {
			String name = req.getParameter("fname");
			String email = req.getParameter("email");
			String phno = req.getParameter("phno");
			String password = req.getParameter("password");
			String check = req.getParameter("check");
			// System.out.println(name+" "+email+" "+phno+" "+password+" "+check);

			User us = new User();
			us.setName(name);
			us.setEmail(email);
			us.setPhno(phno);
			us.setPassword(password);

			HttpSession session = req.getSession();

			if (check != null) {

				UserDAOImpl dao = new UserDAOImpl(DB_Connect.getConn());
				
			boolean f2=	dao.checkUser(email);
				if(f2) {
					
					boolean f = dao.userRegister(us);
					if (f) {
						// System.out.println("User Register Succesfull..");

						session.setAttribute("succMsg", "Successfully Registered...");
						resp.sendRedirect("register.jsp");

					} else {
						// System.out.println("Something Went Wrong..");

						session.setAttribute("failedMsg", "Something Went Wrong!..");
						resp.sendRedirect("register.jsp");

					}
					
					
				}else {
					session.setAttribute("failedMsg", "User Already Exist..");
					resp.sendRedirect("register.jsp");
				}
				
				
				
				
				
			} else {
				// System.out.println("Please check the Agreement..");
				
				session.setAttribute("failedMsg", "Please check the Agreement..");
				resp.sendRedirect("register.jsp");

			}
			
			
			

		} catch (Exception e) {
			e.printStackTrace();
		}

	}

}
