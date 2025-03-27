package com.pack1.controller;

import java.io.IOException;

import com.pack1.dao.RegisterDAO;
import com.pack1.model.RegisterModel;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/RegisterServlet")
public class RegisterController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("Hello");
		
		//retrieve the data from view.
		RegisterModel rm = new RegisterModel();
		String username = request.getParameter("username");
		String email = request.getParameter("email");
		String password = request.getParameter("password");
		
		System.out.println(username);
		System.out.println(email);
		System.out.println(password);
		
		//Setting the data to the Model.
		rm.setUsername(username);
		rm.setEmail(email);
		rm.setPassword(password);
		
		RegisterDAO rd = new RegisterDAO();
		String res = rd.insertStudent(rm);
		if(res.equals("SUCCESS")) {
			
			System.out.println("Data Inserted!");
			RequestDispatcher r = request.getRequestDispatcher("login.jsp");
			r.forward(request, response);
		}
		else {
			System.out.println("Something went wrong!");
			RequestDispatcher r = request.getRequestDispatcher("index.html");
			r.forward(request, response);
		}
		
		
		
		
		
		
		
	}

}
