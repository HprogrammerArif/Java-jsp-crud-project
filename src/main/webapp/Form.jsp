<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Login Form</title>

<!-- Inline CSS for Styling -->
<style>
    body {
        font-family: Arial, sans-serif;
        background-color: #f8f9fa;
        display: flex;
        justify-content: center;
        align-items: center;
        height: 100vh;
        margin: 0;
    }
    form {
        background-color: #ffffff;
        padding: 20px;
        border-radius: 10px;
        box-shadow: 0 0 15px rgba(0, 0, 0, 0.1);
        width: 300px;
        text-align: center;
    }
    h2 {
        color: #333;
        margin-bottom: 20px;
    }
    label {
        display: block;
        font-size: 14px;
        margin-bottom: 5px;
        color: #555;
    }
    input[type="text"], input[type="password"] {
        width: 100%;
        padding: 10px;
        margin-bottom: 15px;
        border: 1px solid #ccc;
        border-radius: 5px;
        font-size: 14px;
    }
    input[type="submit"], input[type="button"] {
        padding: 10px 20px;
        border: none;
        border-radius: 5px;
        background-color: #007BFF;
        color: white;
        font-size: 14px;
        cursor: pointer;
        margin-top: 10px;
    }
    input[type="button"] {
        background-color: #28a745;
    }
    input[type="submit"]:hover, input[type="button"]:hover {
        background-color: #0056b3;
    }
    input[type="button"]:hover {
        background-color: #218838;
    }
</style>
</head>
<body>

<h2>Enter Id and Name: </h2>
<form action="submitForm.jsp" method="post">

    <label for="id">Id: </label>
    <input type="text" id="PID" name="PID" required>

    <label for="name">Name: </label>
    <input type="text" id="PName" name="PName" required>

    <input type="submit" value="Submit">
    <input type="button" value="Show Data" onclick="window.location.href='showData.jsp'">

</form>

</body>
</html>
