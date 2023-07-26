<%@page import="com.mysql.cj.xdevapi.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.ResultSet"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>JSP MySQL 연동 예제</title>
</head>
<body>
	<h1>JSP MySQL 연동 예제</h1>
    <form action="add.jsp" method="post">
        <label for="name">사용자 이름:</label>
        <input type="text" id="username" name="name" required>
        <br>
        <label for="phone">전화번호:</label>
        <input type="text" id="email" name="phone" required>
        <br>
        <label for="addr">주소:</label>
        <input type="text" id="addr" name="addr" required>
        <br>
        <input type="submit" value="이벤트 참여">
    </form>

	<hr>

	<h2>등록된 사용자 목록</h2>
	<%
	Connection conn = null;
	try {
		String jdbcUrl = "jdbc:mysql://localhost:3306/test";
		String dbId = "root";
		String dbPass = "1234!";

		Class.forName("com.mysql.jdbc.Driver");
		conn = DriverManager.getConnection(jdbcUrl, dbId, dbPass);
		out.println("제대로 연결되었습니다.");
	} catch (Exception e) {
		e.printStackTrace();
	}
	%>


</body>
</html>
