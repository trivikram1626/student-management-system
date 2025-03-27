package com.pack1.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import com.pack1.model.LoginModel;
import com.pack1.utility.DBConnection;

public class LoginDAO implements LoginDAOInterface{
	Connection con;
	String status = "FAIL";
	@Override
	public String selectStudent(LoginModel lm) {
		try {
			DBConnection db = new DBConnection();
			con = db.getConnection();
			PreparedStatement ps = con.prepareStatement("select * from studentdetails where username=? and password=?");
			ps.setString(1, lm.getUsername());
			ps.setString(2, lm.getPassword());
			ResultSet rs = ps.executeQuery();
			 if(rs.next()) {
				 status = "SUCCESS";
			 }
			
		}
		catch(Exception e) {
			System.out.println(e);
		}
		return status;
		
	}
//	public boolean isUsernameValid(String username) {
//		return false;
//	}

}
