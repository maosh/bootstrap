<%@ page language="java" import="java.sql.*, com.maosh.model.*" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>Insert title here</title>
</head>
<body>
	<%
		String u=request.getParameter("username");
		String p=request.getParameter("password");
		
		
		UserBeanCl ubc=new UserBeanCl();
		
		if(ubc.checkUser(u,p)){
			response.sendRedirect("wel.jsp?user="+u);
		}else{
			response.sendRedirect("login.jsp?errNo=2");
		}
		
		/*
		Class.forName("org.gjt.mm.mysql.Driver");
		Connection ct=DriverManager.getConnection("jdbc:mysql://localhost:3306/test", "root", "maosh");

		Statement sm=ct.createStatement();
		ResultSet rs=sm.executeQuery("select passwd from users where username='"+u+"'");
		
		if(rs.next()){
			
			if(rs.getString(1).equals(p)){
				response.sendRedirect("wel.jsp?user="+u);
			}else{
				response.sendRedirect("login.jsp?errNo=1");
			}
				
			
		}else{
			response.sendRedirect("login.jsp?errNo=2");
		}
		*/	
		
	%>

</body>
</html>