<%@page import="com.pack1.utility.DBConnection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.sql.*" %>

<%
String username = request.getParameter("username"); // Primary Key
String email = request.getParameter("email");
String password = request.getParameter("password");

try {
    DBConnection db = new DBConnection();
    Connection con = db.getConnection();
    PreparedStatement ps = con.prepareStatement("UPDATE studentdetails SET email=?, password=? WHERE username=?");
    ps.setString(1, email);
    ps.setString(2, password);
    ps.setString(3, username); // Use username as condition (Primary Key)

    int rowsUpdated = ps.executeUpdate();
    con.close();

    if (rowsUpdated > 0) {
        response.sendRedirect("studentdetails.jsp"); // Redirect back to student details page
    } else {
        out.println("Update failed!");
    }
} catch (Exception e) {
    out.println("Error: " + e.getMessage());
}
%>
