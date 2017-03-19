<%-- <%@page import="javax.ws.rs.core.Cookie"%> --%>
<%@ page language="java" import="java.util.*" contentType="text/html; charset=utf-8"%>
<% 
	request.setCharacterEncoding("utf-8");
 %>
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
     		
     		String[] cookies = request.getParameterValues("isCookie");
     		/* out.println("set cookie"); */
      		if(cookies!=null&&cookies.length>0)
      		{
      			/* out.println("set cookie"); */
      			String username = request.getParameter("username");
      			String password = request.getParameter("password");
      			Cookie usernamecookie = new Cookie("username",username);
      			Cookie passwordcookie = new Cookie("password",password);
      			usernamecookie.setMaxAge(864000);
      			passwordcookie.setMaxAge(864000);
      			response.addCookie(usernamecookie);
      			response.addCookie(passwordcookie);
      		}
      		else
      		{
      			Cookie[] cookie = request.getCookies();
      			if(cookie!=null&&cookie.length>0)
      			{
      				for(Cookie c: cookie)
      				{
      					if(c.getName().equals("username")||c.getName().equals("password"))
      					{
      						c.setMaxAge(0);
      						response.addCookie(c);
      					}
      				}
      			}
      		}
      		
     		request.getRequestDispatcher("login_success.jsp").forward(request, response);
     	}
     	else
     	{
     		response.sendRedirect("login_failure.jsp");
     	}
      %>
  </body>
</html>
