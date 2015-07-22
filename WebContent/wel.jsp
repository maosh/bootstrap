<%@ page language="java" import="java.sql.*, com.maosh.model.*, java.util.*" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>Insert title here</title>

<script type="text/javascript">

	function reminder(){
		
		return window.confirm("are you sure?");
		
	}

</script>

</head>
<body bgcolor="#7CADE8">
	登陆成功，欢迎<br>
	<%=request.getParameter("user") %>
	<a href="login.jsp">返回登录</a>
	<hr>
	
	<center>
	<h1>用户信息列表</h1>
	<%
	/*
	int pageSize=10;
	int pageCount=0;
	int rowCount=0;
	*/
	int pageNow=1;
	if(request.getParameter("pageNow")!=null){
		pageNow=Integer.parseInt(request.getParameter("pageNow"));
	}
	
	
	//UserBeanCl ubc=new UserBeanCl();
	//ArrayList al=ubc.getUserByPage(pageNow);
	ArrayList al=(ArrayList)request.getAttribute("result");
	
	int pageCount = Integer.parseInt(request.getAttribute("pageCount").toString());
//	int pageCount=Integer.parseInt(s_pageCount);
	/*	
	Class.forName("org.gjt.mm.mysql.Driver");
	Connection ct=DriverManager.getConnection("jdbc:mysql://localhost:3306/test", "root", "maosh");
	
	Statement sm=ct.createStatement();
	ResultSet rs=sm.executeQuery("select count(*) from users");
	if(rs.next()){
		rowCount=rs.getInt(1);	
	}
	
	
	
	if(rowCount%pageSize==0){
		pageCount=rowCount/pageSize;
	}else{
		pageCount=rowCount/pageSize+1;
	}
	
	//display
	
		rs=sm.executeQuery("select * from users limit "+pageNow*pageSize+","+pageSize);
	*/
	%>
	
	<table border="1">
	<tr bgcolor="pink"><td>id</td><td>username</td><td>password</td><td>email</td><td>grade</td><td>update </td><td>delete </td></tr>
	<%
		String []color={"silver","white"};
		for(int i=0; i<al.size();i++){
			UserBean ub=(UserBean)al.get(i);
			%>
			<tr bgcolor=<%=color[i%2] %>>
			<td><%=ub.getUserID() %></td>
			<td><%=ub.getUserName() %></td>
			<td><%=ub.getPassword() %></td>
			<td><%=ub.getEmail() %></td>
			<td><%=ub.getGrade() %></td>
			
			<td><a href="updateUser.jsp?userId=<%=ub.getUserID()%>&userName=<%=ub.getUserName()%>&password=<%=ub.getPassword() %>&email=<%=ub.getEmail() %>
			&grade=<%= ub.getGrade() %>">update</a></td>
			<td><a onclick="return reminder()" href="usercl?flag=delete&userId=<%= ub.getUserID() %>">delete</a></td>
			</tr>
			<%
		}
	
	
	%>	
	</table>
		<%
	if(pageNow!=1){
	out.println("<a href=usercl?flag=fenye&pageNow="+(pageNow-1)+"> 上一页</a>");
	}
	//get pageCount
	
	for(int i=pageNow;i<pageNow+5; i++){
	out.println("<a href=usercl?flag=fenye&pageNow="+i+"> ["+i+"]</a>");
	}

	if(pageNow!=1){
	out.println("<a href=usercl?flag=fenye&pageNow="+(pageNow+1)+"> 下一页</a>");
	}
	%>	
	</center>
</body>
</html>