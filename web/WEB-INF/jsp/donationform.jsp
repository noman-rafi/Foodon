<%-- 
Document   : donated
	Created on : May 13, 2015, 5:03:39 AM
 Author     : Noman Rafi
	--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
    "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<title>Donate</title>
                

    <!-- Custom Fonts -->
    <!link href="bootstrap/css/bootstrap.min.css" rel="stylesheet" type="text/css" /-->
    <link rel="stylesheet" href="<c:url value="resources/css/font-awesome.min.css"/>" type="text/css">
    <link rel="stylesheet" href="<c:url value="resources/css/creative.css"/>" type="text/css">
        <link rel="stylesheet" href="<c:url value="resources/css/animate.min.css"/>" type="text/css">
        <link rel="stylesheet" href="<c:url value="resources/css/script.js"/>" type="text/javascript">
        <link rel="stylesheet" href="<c:url value="resources/css/bootstrap.min.css"/>" type="text/javascript">


<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js" type="application/javascript"></script>
<script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/js/bootstrap.min.js" type="application/javascript"></script>
<script type="text/javascript" src="script.js"></script>

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
	<body onload="getLocation(); setDate();">
            <script type="text/javascript">
            function setDate(){
                var dt = Date();
                document.getElementById("time").value = dt.substring(0,25);
            }
            function getLocation() {
                if (navigator.geolocation) {
                    navigator.geolocation.getCurrentPosition(showPosition);
                } else { 
                    x.value = "Geolocation is not supported by this browser.";
                }
            }

            function showPosition(position) {
                var x = document.getElementById("lat");
                var y = document.getElementById("lon");
                x.value =  position.coords.latitude;
                y.value =  position.coords.longitude;	
            }
            </script>
            <div class="container">
            <div class="well">
		<h1 style="text-align:center;">Donation Form</h1>
            </div>
            
                    <form:form method="POST" action="/Test2/addDonation" >
                    <div class="form-group">
                        <form:label path="name" >Name:</form:label>
		    	<form:input path="name" type="text" class="form-control" /><br />
                </div>
                <div class="form-group">
			<form:label path="phone">Phone:</form:label>
			<form:input path="phone" type="text" class="form-control" /><br />
            </div>
                        
			<form:input path="latitude" id="lat" type="hidden" step="any" />
			<form:input path="longitude" id="lon"  type="hidden" step="any" />
                        <form:input path="time" id="time" type="hidden" />
			<div class="form-group">
			<form:label for="comment" path="notes">Notes:</form:label>
			<form:textarea path="notes" class="form-control" rows="5" id="comment" /><br/>
            </div>
			
			<input type="submit" value="Donate" class="btn btn-info btn-lg">
                        <a  href="/Test2/" value="Return" class="btn btn-info btn-lg" id="back">Return</a>
			</form:form>
            </div>
	</body>
</html>
