package com.pack1.controller;

import java.io.IOException;

import com.pack1.dao.LoginDAO;
import com.pack1.model.LoginModel;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/LoginServlet")
public class LoginController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		System.out.println("Hello Login Controller");
		String username = request.getParameter("username");
		String password = request.getParameter("password");

		LoginModel lm = new LoginModel();
		lm.setUsername(username);   
		lm.setPassword(password);

		LoginDAO ld = new LoginDAO();
		String res = ld.selectStudent(lm);
		System.out.println(res);

		if (res.equals("SUCCESS")) {
			System.out.println("Data Found!");

			HttpSession session = request.getSession();
			session.setAttribute("username", username);

			response.sendRedirect("home.jsp");
		} else {
			System.out.println("Data Not Found!");

			RequestDispatcher rd = request.getRequestDispatcher("login.jsp");
			rd.forward(request, response);
		}

//		boolean hasError = false;
//
//		if (username == null || username.trim().isEmpty()) {
//			request.setAttribute("username", "*Username is Required!");
//			hasError = true;
//		}
//
//		if (password == null || password.trim().isEmpty()) {
//			request.setAttribute("password", "*Password is Required!");
//			hasError = true;
//		}
//
//		if (!hasError && !res.equals("SUCCESS")) {
//			request.setAttribute("loginError", "Invalid Credentials!!!");
//			hasError = true;
//		}

//		if (hasError) {
//			System.out.println("Data Not Found!");
//
//			RequestDispatcher rd = request.getRequestDispatcher("login.jsp");
//			rd.forward(request, response);
//
////			request.setAttribute("username", username);
////			RequestDispatcher rd = request.getRequestDispatcher("home.jsp");
////			rd.forward(request, response);
//		} else {
//
//			System.out.println("Data Found!");
//
//			HttpSession session = request.getSession();
//			session.setAttribute("username", username);
//
//			response.sendRedirect("home.jsp");
//
//		}

	}

}
