<%-- 
    Document   : Login
    Created on : May 10, 2015, 10:16:29 PM
    Author     : Noman Rafi
--%>


<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Foodon - Login</title>
    </head>
    <body>
       	<h1>Login</h1>
                    <form:form method="POST" action="/Test2/login" >
                        <form:label path="username">Username:</form:label>
		    	<form:input path="username" type="text" /><br />
 
			<form:label path="password">Password:</form:label>
			<form:input path="password" type="password" /><br />
               
			
			<input type="submit" value="Login">
			</form:form>
	</body>
</html>
