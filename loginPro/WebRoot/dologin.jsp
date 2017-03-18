<%@ page language="java" import="java.util.*" contentType="text/html; charset=utf-8"%>
<jsp:useBean id="loginuser" class="com.po.Users" scope="page"></jsp:useBean>
<jsp:useBean id="userDAO" class="com.dao.UsersDAO" scope="page"></jsp:useBean>
<<jsp:setProperty property="*" name="loginuser"/>

<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>登录</title>
    
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
     	if(userDAO.usersLogin(loginuser))
     	{
     		session.setAttribute("loginuser", loginuser.getUsername());
     		request.getRequestDispatcher("login_success.jsp").forward(request, response);
     	}
     	else
     	{
     		response.sendRedirect("login_failure.jsp");
     	}
      %>
  </body>
</html>
