<%-- 
Document   : donated
	Created on : May 13, 2015, 5:03:39 AM
 Author     : Noman Rafi
	--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
    "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<title>Donate</title>
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
            
		<h1>Donation Form</h1>
                    <form:form method="POST" action="/Test2/addDonation" >
                        <form:label path="name">Name:</form:label>
		    	<form:input path="name" type="text" /><br />
 
			<form:label path="phone">Phone:</form:label>
			<form:input path="phone" type="text" /><br />
                        
			<form:input path="latitude" id="lat" type="hidden" step="any" />
			<form:input path="longitude" id="lon"  type="hidden" step="any" />
                        <form:input path="time" id="time" type="hidden" />
			
			<form:label path="notes">Notes:</form:label>
			<form:input path="notes" type="text" /><br/>
			
			<input type="submit" value="Donate">
			</form:form>
	</body>
</html>
