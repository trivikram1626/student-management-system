<%@page import="com.pack1.utility.DBConnection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.sql.PreparedStatement" %>
<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.ResultSet" %>

<%
String username = request.getParameter("username");	// Get username from URL
out.println(username);
if (username == null || username.isEmpty()) {
    out.println("Error: No username provided!");
    return;
}

try {
    DBConnection db = new DBConnection();
    Connection con = db.getConnection();
    
    //check if user exits before deleting
    PreparedStatement checkStmt = con.prepareStatement("SELECT * FROM studentdetails WHERE username=?");
    checkStmt.setString(1, username);
    ResultSet rs = checkStmt.executeQuery();

    if (!rs.next()) {
        out.println("Error: Username does not exist!");
        return;
    }
    
    //Delete the user
    PreparedStatement delStmt = con.prepareStatement("DELETE FROM studentdetails WHERE username=?");
    delStmt.setString(1, username);

    int rowsDeleted = delStmt.executeUpdate();
    con.close();

    if (rowsDeleted > 0) {
        response.sendRedirect("studentdetails.jsp"); // Redirect to student details page
    } else {
        out.println("Delete failed!");
    }
} catch (Exception e) {
    out.println("Error: " + e.getMessage());
}
%>
