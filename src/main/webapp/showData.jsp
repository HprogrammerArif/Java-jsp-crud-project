<%@ page import="java.sql.*" language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>All Data</title>

<!-- Inline CSS for Styling -->
<style>
    body {
        font-family: Arial, sans-serif;
        background-color: #f0f0f0;
        margin: 20px;
        text-align: center;
    }
    h2 {
        color: #333;
    }
    table {
        width: 80%;
        margin: 20px auto;
        border-collapse: collapse;
        background-color: #fff;
        box-shadow: 0px 0px 10px rgba(0, 0, 0, 0.1);
    }
    table, th, td {
        border: 1px solid #ddd;
    }
    th, td {
        padding: 12px;
        text-align: center;
    }
    th {
        background-color: #4CAF50;
        color: white;
    }
    tr:nth-child(even) {
        background-color: #f2f2f2;
    }
    button {
        padding: 10px 15px;
        background-color: #007BFF;
        color: white;
        border: none;
        border-radius: 5px;
        cursor: pointer;
    }
    button:hover {
        background-color: #0056b3;
    }
    input[type="button"] {
        background-color: #28a745;
        color: white;
        border: none;
        padding: 10px 20px;
        border-radius: 5px;
        cursor: pointer;
        margin-top: 20px;
    }
    input[type="button"]:hover {
        background-color: #218838;
    }
</style>
</head>
<body>

<h2>All Data</h2>
<input type="button" value="Back" onclick="window.location.href='Form.jsp'">

<%
Connection conn = null;
PreparedStatement pstmt = null;
ResultSet rs = null;

// Database connection details
String dbURL = "jdbc:oracle:thin:@localhost:1521:xe";
String dbUser = "system";  // Replace with your actual schema username
String dbPass = "arif";    // Replace with your actual password

try {
    // Load the Oracle JDBC driver
    Class.forName("oracle.jdbc.driver.OracleDriver");
    
    // Establish connection
    conn = DriverManager.getConnection(dbURL, dbUser, dbPass);
    
    // Prepare SQL SELECT statement
    String sql = "SELECT * FROM Person";
    pstmt = conn.prepareStatement(sql);
    
    // Execute the query
    rs = pstmt.executeQuery();
    
    // Display the data in a table format for better presentation
    out.println("<table>");
    out.println("<tr><th>PID</th><th>PName</th><th colspan='2'>Actions</th></tr>");
    
    while (rs.next()) {
        String id = rs.getString("PID");
        String name = rs.getString("PNAME");
        
        // Display each row with Edit and Delete buttons
        out.println("<tr>");
        out.println("<td>" + id + "</td>");
        out.println("<td>" + name + "</td>");
        out.println("<td><a href='deleteForm.jsp?PID=" + id + "'><button>Delete</button></a></td>");
        out.println("<td><a href='updateForm.jsp?PID=" + id + "'><button>Edit</button></a></td>");
        out.println("</tr>");
    }
    
    out.println("</table>");
    
} catch (Exception e) {
    out.println("<h2>Error: " + e.getMessage() + "</h2>");
} finally {
    if (rs != null) try { rs.close(); } catch (SQLException e) { e.printStackTrace(); }
    if (pstmt != null) try { pstmt.close(); } catch (SQLException e) { e.printStackTrace(); }
    if (conn != null) try { conn.close(); } catch (SQLException e) { e.printStackTrace(); }
}
%>

</body>
</html>
