<%-- 
    Document   : Login
    Created on : May 10, 2015, 10:16:29 PM
    Author     : Noman Rafi
--%>


<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>


<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Foodon - Login</title>
        <!--link href="bootstrap/css/bootstrap.min.css" rel="stylesheet" type="text/css" /-->
<link rel="stylesheet" href="<c:url value="resources/css/font-awesome.min.css"/>" type="text/css">
    <link rel="stylesheet" href="<c:url value="resources/css/creative.css"/>" type="text/css">
        <link rel="stylesheet" href="<c:url value="resources/css/animate.min.css"/>" type="text/css">
        <link rel="stylesheet" href="<c:url value="resources/css/script.js"/>" type="text/javascript">
        <link rel="stylesheet" href="<c:url value="resources/css/bootstrap.min.css"/>" type="text/javascript">
<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js" type="application/javascript"></script>
<script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/js/bootstrap.min.js" type="application/javascript"></script>
<!--script type="text/javascript" src="script.js"></script-->
        
        <style type="text/css">

    .btn {
        border-radius:0px;
        background-color: #16499a !important;
    }
    .container {
        width: 600px;
    }
    .well {
        background-color: #f0a30a !important;
        color: white;
        border-radius: 0px;
    }
    .form-control {
        border-radius:0px;
    }
    #back {
        background-color: #9a1616 !important;
    }
</style>

    </head>
    <body>
        <div class="container">
       	<h1 class="well">Login</h1>
                    <form:form method="POST" action="/Test2/login" >
                    <div class="form-group">
                        <form:label path="username">Username:</form:label>
		    	<form:input path="username" class="form-control" type="text" /><br />
                </div>
                <div class="form-group">
			<form:label path="password">Password:</form:label>
			<form:input path="password" class="form-control" type="password" /><br />
               </div>
			
			<input type="submit" value="Login" class="btn btn-info btn-lg"/>
                        <a  href="/Test2/" value="Return" class="btn btn-info btn-lg" id="back">Return</a>
			</form:form>
            </div>
	</body>
</html>
