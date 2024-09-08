<%@ page import="java.sql.Connection, java.sql.DriverManager, java.sql.PreparedStatement" language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Delete Data</title>
</head>
<body>

  <%
String id = request.getParameter("PID");
out.println("<h2>PID received: " + id + "</h2>");  // Debugging - print the received PID

Connection conn = null;
PreparedStatement pstmt = null;

String dbURL = "jdbc:oracle:thin:@localhost:1521:xe";
String dbUser = "system"; // Replace with your actual schema username
String dbPass = "arif";   // Replace with your actual password

try {
    // Load Oracle JDBC driver
    Class.forName("oracle.jdbc.driver.OracleDriver");
    
    // Establish connection
    conn = DriverManager.getConnection(dbURL, dbUser, dbPass);
    
    // Prepare SQL DELETE statement
    String sql = "DELETE FROM Person WHERE PID=?";
    out.println("<h2>Executing query: " + sql + " with PID: " + id + "</h2>");  // Debugging - print the query
    pstmt = conn.prepareStatement(sql);
    pstmt.setString(1, id.trim());  // Trim to remove any leading/trailing spaces
    
    // Execute the deletion
    int rows = pstmt.executeUpdate();
    
    if (rows > 0) {
        out.println("<h2>Data successfully deleted!!</h2>");
    } else {
        out.println("<h2>Failed to delete data!! No matching PID found.</h2>");
    }
    
    // Redirect back to showData.jsp after deletion
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
