<%-- 
    Document   : logs
    Created on : May 17, 2015, 12:27:43 PM
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
		<title>Collect Donation</title>
	</head>

	<body onload="initialize();">
            
            <script type="text/javascript">
            function initialize() {
            var data = [], donData;
            <c:forEach items="${entry}" var="don">  
            donData={id:'${don.id}',nam:'${don.name}',phon:'${don.phone}',lat:${don.latitude},lon:${don.longitude},tim:'${don.time}',notes:'${don.notes}'};
            data.push(donData);
            </c:forEach>
                var dt = Date();
                document.getElementById("time").value = dt.substring(0,25);
                document.getElementById("name").value = points[i]['nam'];
                document.getElementById("phone").value = points[i]['phon'];
                document.getElementById("lat").value = points[i]['lat'];
                document.getElementById("lon").value = points[i]['lon'];
            }  
            </script>
            
		<h1>Collect Donation</h1>
                    <form:form method="POST" action="/Test2/addLog" >
                        <form:label path="name">Name:</form:label>
		    	<form:input id="name" path="name" type="text" /><br />
 
			<form:label path="phone">Phone:</form:label>
			<form:input id="phone" path="phone" type="text" /><br />
                        
			<form:input path="latitude" id="lat" type="hidden" step="any" />
			<form:input path="longitude" id="lon"  type="hidden" step="any" />
                        <form:input path="time" id="time" type="hidden" />
                        
			<form:label path="weight">Weight:</form:label>
			<form:input id="weight" path="weight" type="text" /><br />
                        
                        <form:label path="status">Status:</form:label>
			<form:input  path="status" type="text" /><br />
                        
			<form:label path="notes">Notes:</form:label>
			<form:input path="notes" type="text" /><br/>
			
			<input type="submit" value="Donate">
			</form:form>
	</body>
</html>

