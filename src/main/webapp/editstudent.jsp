<%@page import="com.pack1.utility.DBConnection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.sql.*" %>
<%@ page session="true" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Edit Student</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background: #f4f4f4;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
        }
        .container {
            background: white;
            padding: 20px;
            border-radius: 10px;
            box-shadow: 0px 0px 10px rgba(0, 0, 0, 0.1);
            width: 400px;
        }
        input {
            width: 100%;
            padding: 8px;
            margin: 5px 0;
            border: 1px solid #ccc;
            border-radius: 5px;
        }
        .btn {
            width: 100%;
            padding: 10px;
            background: #007bff;
            color: white;
            border: none;
            border-radius: 5px;
            cursor: pointer;
        }
    </style>
</head>
<body>
    <div class="container">
    	<a href="studentdetails.jsp" class="back-link">← Back to Student Details</a>
        <h2>Edit StudentDetails</h2>
        
        <%
        String username = request.getParameter("username"); // Get student email from URL
        String email = "", password = "";
        
        try {
            DBConnection db = new DBConnection();
            Connection con = db.getConnection();
            PreparedStatement ps = con.prepareStatement("SELECT * FROM studentdetails WHERE email=?");
            ps.setString(1, username);
            ResultSet rs = ps.executeQuery();

            if (rs.next()) {
                username = rs.getString("username");
                email = rs.getString("email");
                password = rs.getString("password");
            }
            con.close();
        } catch (Exception e) {
            out.println("Error: " + e.getMessage());
        }
        %>
        
        <form action="updatestudent.jsp" method="post">
	    <input type="hidden" name="username" value="<%= username %>">
	    
	    <label>Username:</label>
	    <input type="text" value="<%= username %>" disabled> <!-- Username is disabled for editing -->
	    
	    <label>Email:</label>
	    <input type="email" name="email" value="<%= email %>" required>
	    
	    <label>Password:</label>
	    <input type="password" name="password" value="<%= password %>" required>
	    
	    <button type="submit" class="btn">Update</button>
</form>
    </div>
</body>
</html>
