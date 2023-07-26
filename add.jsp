<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>사용자 추가 결과</title>
</head>
<body>
    <h1>사용자 추가 결과</h1>
    <%
        String name = request.getParameter("name");
        String phone = request.getParameter("phone");
        String addr = request.getParameter("addr");

        try {
        	Connection conn = null;
        	try {
        		String jdbcUrl = "jdbc:mysql://localhost:3306/test";
        		String dbId = "root";
        		String dbPass = "1234!";

        		Class.forName("com.mysql.jdbc.Driver");
        		conn = DriverManager.getConnection(jdbcUrl, dbId, dbPass);
               	} catch (Exception e) {
        		e.printStackTrace();
        	}

            // SQL 쿼리 실행
            PreparedStatement pstmt = conn.prepareStatement("INSERT INTO event1 (name, phone, addr) VALUES (?, ?, ?)");
            pstmt.setString(1, name);
            pstmt.setString(2, phone);
            pstmt.setString(3, addr);
            pstmt.executeUpdate();

            // 연결 및 리소스 해제
            pstmt.close();
            conn.close();

            out.println("사용자가 추가되었습니다.");

        } catch (Exception e) {
            out.println("Error: " + e.getMessage());
        }
    %>
</body>
</html>
