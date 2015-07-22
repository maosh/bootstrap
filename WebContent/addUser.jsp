<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>Insert title here</title>
</head>
<body>

<center>
<h1>输入用户信息</h1>
<form action="usercl?flag=addUser" method="post">

	<table border="1">
	
	<tr><td>username</td><td><input type="text" name="userName" /></td></tr>
	<tr><td>password</td><td><input type="password" name="password" /></td></tr>	
	<tr><td>email</td><td><input type="text" name="email" /></td></tr>	
	<tr><td>grade</td><td><input type="text" name="grade" /></td></tr>	
	<tr><td>submit</td><td><input type="submit" name="submit" /></td>
	<td>reset</td><td><input type="reset" name="reset" /></td>
	</tr>	
	</table>



</form>

</center>

</body>
</html>