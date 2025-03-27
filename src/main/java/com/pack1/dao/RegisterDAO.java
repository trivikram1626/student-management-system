package com.pack1.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;

import com.pack1.model.RegisterModel;
import com.pack1.utility.DBConnection;

public class RegisterDAO implements RegisterDAOInterface{
	Connection con;
	String status = "FAIL";
	public String insertStudent(RegisterModel rm) {
		try {
			DBConnection db = new DBConnection();
			con = db.getConnection();
			PreparedStatement ps = con.prepareStatement("insert into studentdetails values (?,?,?)");
			ps.setString(1,rm.getUsername() );
			ps.setString(2,rm.getEmail() );
			ps.setString(3,rm.getPassword());
			int n = ps.executeUpdate();
			
			if(n > 0) {
				status = "SUCCESS";
			}
			
		}
		catch(Exception e) {
			System.out.println(e);
		}
		return status;
	}
	
	

}
