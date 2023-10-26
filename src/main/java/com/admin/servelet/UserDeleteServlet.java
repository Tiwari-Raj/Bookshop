


package com.admin.servelet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.DB.DB_Connect;
import com.DOA.UserDAOImpl;

@WebServlet("/deleteuser")
public class UserDeleteServlet extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		try {
			int id = Integer.parseInt(req.getParameter("id"));
			UserDAOImpl dao = new UserDAOImpl(DB_Connect.getConn());
			boolean f = dao.deleteUser(id);

			HttpSession session = req.getSession();

			if (f) {

				session.setAttribute("succMsg", "User Deleted...");
				resp.sendRedirect("admin//all_user.jsp");
			} else {

				session.setAttribute("failedMsg", "Something went wrong!!!");
				resp.sendRedirect("admin//all_user.jsp");

			}

		} catch (Exception e) {
			e.printStackTrace();
		}
	}

}


