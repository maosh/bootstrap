<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>

	<%
	
	//receive first num
	String s_num1=request.getParameter("num1");
	
	//receive second num
	String s_num2=request.getParameter("num2");
	
	
	//receive char
	
	String flag=request.getParameter("flag");
	
	//caculate
	
	int num1, num2;
	int result=0;
	num1=Integer.parseInt(s_num1);
	num2=Integer.parseInt(s_num2);
	
	if(flag.equals("+")){
		result=num1+num2;
		
	}else if(flag.equals("-")){
		result=num1-num2;
	}else if(flag.equals("*")){
		result=num1*num2;
	}else if(flag.equals("/")){
		result=num1/num2;
	}
	
	out.println("result is:"+result);
	
	//output result
	
	%>

</body>
</html>