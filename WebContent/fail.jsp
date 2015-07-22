<%@ page language="java" import="java.sql.*, com.maosh.model.*, java.util.*" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>Insert title here</title>
</head>
<body bgcolor="#7CADE8">
	操作失败，欢迎<br>
	<%=request.getParameter("user") %>
	<a href="login.jsp">返回登录</a>
	<hr>
</body>
</html>