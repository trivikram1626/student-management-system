<%@page import="com.pack1.utility.DBConnection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.sql.*" %>
<%@ page session="true" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
     <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
    <title>Student Details</title>
    <style>
    .user {
    		font-weight: bold;
    		color : yellow;
    	}
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
            font-family: Arial, sans-serif;
        }
        body {
            background: #f4f4f4;
        }
        .navbar {
            display: flex;
            justify-content: space-between;
            align-items: center;
            background: #007bff;
            padding: 15px;
            color: white;
        }
        .navbar a {
            color: white;
            text-decoration: none;
            margin: 0 15px;
            font-weight: bold;
        }
        .navbar a i {
            margin-right: 8px;
            font-size: 18px;
        }
        .navbar a:hover {
            text-decoration: underline;
        }
        .navbar .user {
            font-weight: bold;
        }
        .container {
            width: 90%;
            margin: 20px auto;
            background: white;
            padding: 20px;
            border-radius: 10px;
            box-shadow: 0px 0px 10px rgba(0, 0, 0, 0.1);
        }
        h2 {
            text-align: center;
            margin-bottom: 20px;
        }
        table {
            width: 100%;
            border-collapse: collapse;
            text-align: center;
        }
        table, th, td {
            border: 1px solid #ddd;
        }
        th, td {
            padding: 10px;
        }
        th {
            background: #007bff;
            color: white;
        }
        .btn {
            padding: 5px 10px;
            border: none;
            color: white;
            cursor: pointer;
            border-radius: 5px;
        }
        .edit {
            background: #19b149;
        }
        .delete {
            background: #dc3545;
        }
        .btn:hover {
            opacity: 0.8;
        }
    </style>
</head>
<body>
    <div class="navbar">
        <div>
            <a href="home.jsp"><i class="fas fa-home"></i>Home</a>
            <a href="studentdetails.jsp"><i class="fas fa-home"></i>Student Details</a>
           
        </div>
        <div class="user">Logged in as: <%= session.getAttribute("username") != null ? session.getAttribute("username") : "Guest" %>
         <a href="login.jsp">Logout</a>
         </div>
    </div>

    <div class="container">
        <h2>Student Details</h2>
        <table class="table-hover table-dark">
            <tr>
                <th>username</th>
                <th>email</th>	
                <th>password</th>
                <th>Edit Info</th>
                
            </tr>
            <%
                try {
                    DBConnection db = new DBConnection();
                    Connection con = db.getConnection();
                    PreparedStatement ps = con.prepareStatement("select * from studentdetails");
                    ResultSet rs = ps.executeQuery();

                    while (rs.next()) {
            %>
            <tr>
                <td><%= rs.getString("username") %></td>
                <td><%= rs.getString("email") %></td>
                <td><%= rs.getString("password") %></td>
                <td>
	                <a href="editstudent.jsp?username=<%= rs.getString("email") %>" class="btn edit">Edit</a>
	                <a href="deletestudent.jsp?username=<%= rs.getString("username") %>" class="btn delete" onclick="return confirm('Are you sure?')">Delete</a>
                </td>
            </tr>
            <%
                    }
                    con.close();
                } catch (Exception e) {
                    out.println("Error: " + e.getMessage());
                }
            %>
        </table>
    </div>
</body>
</html>
