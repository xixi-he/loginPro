<%@ page language="java" import="java.util.*" contentType="text/html; charset=utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'login_success.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->

  </head>
  
  <body>
	<% 
		String user = "";
		if(session.getAttribute("loginuser")!=null)
		{
			user = session.getAttribute("loginuser").toString();
		}  	
	%>
	<% 
		String username = "";
		String password = "";
		Cookie[] cookies = request.getCookies();
		if(cookies!=null&&cookies.length>0)
		{
			
			for(Cookie c:cookies)
			{
				String tmp = c.getName();
				/* out.println("we got the cookies : "+tmp); */
				if(c.getName().equals("username"))
				{
					/* out.println("okokokoko"); */
					username = c.getValue();
				}
				if(c.getName().equals("password"))
				{
					password = c.getValue();
				}
			}
		}
	 %>
    <h1>welcome:<font color="red"><%=user %></font></h1>
    <hr/>
    <h2>用户名：<%= username %></h2>
    <h2>密码：<%= password %></h2>
  </body>
</html>
