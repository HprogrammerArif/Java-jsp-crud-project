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
        text-align: center;
    }
    h2 {
        color: #333;
    }
    .success {
        background-color: #dff0d8;
        color: #3c763d;
        padding: 20px;
        border-radius: 10px;
        margin-bottom: 20px;
        display: inline-block;
    }
    .error {
        background-color: #f2dede;
        color: #a94442;
        padding: 20px;
        border-radius: 10px;
        margin-bottom: 20px;
        display: inline-block;
    }
</style>
</head>
<body>

<%
String oldPID = request.getParameter("oldPID");  // This is the original PID
String newPID = request.getParameter("newPID");  // This is the new PID entered by the user
String name = request.getParameter("PName");

Connection conn = null;
PreparedStatement pstmt = null;

String dbURL = "jdbc:oracle:thin:@localhost:1521:xe";
String dbUser = "system"; 
String dbPass = "arif";  

try {
    // Load Oracle JDBC driver
    Class.forName("oracle.jdbc.driver.OracleDriver");
    
    // Establish connection
    conn = DriverManager.getConnection(dbURL, dbUser, dbPass);
    
    // Prepare SQL UPDATE statement to update both PID and PName
    String sql = "UPDATE Person SET PID=?, PName=? WHERE PID=?";
    pstmt = conn.prepareStatement(sql);
    pstmt.setString(1, newPID);  // Set the new PID
    pstmt.setString(2, name);    // Set the updated name
    pstmt.setString(3, oldPID);  // Use the old PID to find the correct record
    
    // Execute the update
    int rows = pstmt.executeUpdate();
    
    if (rows > 0) {
        out.println("<h2>Data successfully updated!!</h2>");
    } else {
        out.println("<h2>Failed to update data!!</h2>");
    }
    
    // Redirect back to showData.jsp after update
    response.setHeader("Refresh", "2; URL=showData.jsp");
    
} catch (Exception e) {
    out.println("<h2>Error: " + e.getMessage() + "</h2>");
} finally {
    if (pstmt != null) pstmt.close();
    if (conn != null) conn.close();
}
%>

</body>
</html>
