<%@ page import="java.sql.*" language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%

String id = request.getParameter("PID");
String name = request.getParameter("PName");

Connection conn = null;
PreparedStatement pstmt = null;
String dbURL = "jdbc:oracle:thin:@localhost:1521:xe";
String dbUser = "system";
String dbPass = "arif";

try {
	//load oracle jdbc drive
	Class.forName("oracle.jdbc.driver.OracleDriver");
	//establish connection
	conn = DriverManager.getConnection(dbURL, dbUser, dbPass);
	//prepare sql insert statement
	String sql = "INSERT INTO Person(PID, PName) VALUES(?,?)";
	pstmt = conn.prepareStatement(sql);
	pstmt.setString(1, id); //set thee id parameter
	pstmt.setString(2,name); //set name parameter
	
	//exucute the statement
	int rows = pstmt.executeUpdate();
	if(rows>0) {
		out.println("<h2>Data successfully inserted!!</h2>");
		response.setHeader("Refresh","2; URL=Form.jsp");
	} else {
		out.println("<h2>Failed to insert data!!</h2>");
	}
	
} catch (Exception e) {
	out.println("<h2>Error: " + e.getMessage()+ " </h2>");
} finally {
	if(pstmt != null) pstmt.close();
	if(conn != null) conn.close();
}


%>
</body>
</html>