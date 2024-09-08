<%@ page import="java.sql.*" language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Update Person Data</title>

<style>
    body {
        font-family: Arial, sans-serif;
        background-color: #f0f0f0;
        margin: 50px;
    }
    h2 {
        color: #333;
    }
    form {
        background-color: #fff;
        padding: 20px;
        border-radius: 10px;
        box-shadow: 0px 0px 10px rgba(0, 0, 0, 0.1);
        max-width: 400px;
        margin: auto;
    }
    label {
        display: block;
        margin-bottom: 10px;
        font-weight: bold;
        color: #333;
    }
    input[type="text"] {
        width: 100%;
        padding: 10px;
        margin-bottom: 20px;
        border: 1px solid #ccc;
        border-radius: 5px;
    }
    input[type="submit"] {
        background-color: #4CAF50;
        color: white;
        padding: 10px 20px;
        border: none;
        border-radius: 5px;
        cursor: pointer;
        font-size: 16px;
    }
    input[type="submit"]:hover {
        background-color: #45a049;
    }
</style>
</head>
<body>
<%
String id = request.getParameter("PID");

Connection conn = null;
PreparedStatement pstmt = null;
ResultSet rs = null;

String dbURL = "jdbc:oracle:thin:@localhost:1521:xe";
String dbUser = "system"; 
String dbPass = "arif";  

String name = "";

try {
    // Load Oracle JDBC driver
    Class.forName("oracle.jdbc.driver.OracleDriver");
    
    // Establish connection
    conn = DriverManager.getConnection(dbURL, dbUser, dbPass);
    
    // Prepare SQL SELECT statement to fetch the current data for the given PID
    String sql = "SELECT PName FROM Person WHERE PID = ?";
    pstmt = conn.prepareStatement(sql);
    pstmt.setString(1, id);
    
    // Execute query and get the current data
    rs = pstmt.executeQuery();
    
    if (rs.next()) {
        name = rs.getString("PName");
    }
    
} catch (Exception e) {
    out.println("<h2>Error: " + e.getMessage() + "</h2>");
} finally {
    if (rs != null) rs.close();
    if (pstmt != null) pstmt.close();
    if (conn != null) conn.close();
}
%>

<h2>Update Person Data</h2>
<form action="updateData.jsp" method="post">
    <input type="hidden" name="oldPID" value="<%= id %>">

    <label for="PID">PID:</label>
    <input type="text" name="newPID" value="<%= id %>">

    <label for="PName">Name:</label>
    <input type="text" name="PName" value="<%= name %>">

    <input type="submit" value="Update">
</form>

</body>
</html>
