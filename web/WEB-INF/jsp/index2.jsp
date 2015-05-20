<%-- 
    Document   : index
    Created on : May 15, 2015, 5:11:53 PM
    Author     : Noman Rafi
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<!DOCTYPE html>
<html lang="en">

<head>

    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>FOODON- Share your Food</title>

    <!-- Bootstrap Core CSS -->
    <link rel="stylesheet" href="<c:url value="resources/css/bootstrap.min.css"/>" type="text/css">

    <!-- Custom Fonts -->
    <link href='http://fonts.googleapis.com/css?family=Open+Sans:300italic,400italic,600italic,700italic,800italic,400,300,600,700,800' rel='stylesheet' type='text/css'>
    <link href='http://fonts.googleapis.com/css?family=Merriweather:400,300,300italic,400italic,700,700italic,900,900italic' rel='stylesheet' type='text/css'>
    <link rel="stylesheet" href="<c:url value="resources/css/font-awesome.min.css"/>" type="text/css">
    <link rel="stylesheet" href="<c:url value="resources/css/styles.css"/>" type="text/css">

    <!-- Plugin CSS -->
    <link rel="stylesheet" href="<c:url value="resources/css/animate.min.css"/>" type="text/css">

    <!-- Custom CSS -->
    <link rel="stylesheet" href="<c:url value="resources/css/creative.css"/>" type="text/css">

    <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
        <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
        <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->
    <script src="http://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
<script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/js/bootstrap.min.js"></script>
<script type="application/javascript">
// when .modal-wide opened, set content-body height based on browser height; 200 is appx height of modal padding, modal title and button bar

$(".modal-wide").on("show.bs.modal", function() {
  var height = $(window).height() - 200;
  $(this).find(".modal-body").css("max-height", height);
});
</script>
<script type="text/javascript">
    //$( "#donate" ).click("/donationform");
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
    
    <style>
        #close{
            font-size: 20px;
            width: 100%;
            margin-top: 10px;
        }
        #submit{
            width: 100%;
            background-color: rgb(240, 95, 64);
            font-size: 20px;
        }
        .btn{
            border-radius:0px;
            background-color: transparent;
	font-size: 50px;
	width: 300px;
        }
        h1{
            color: black;
        }
        .form-control {
            
            border-radius: 0px;
        }
        .modal.modal-wide .modal-dialog {
  width: 40%;
}
header{
    text-align: left;
}
label{
   color: black;
   text-align: left;
}
.modal-wide .modal-body {
  overflow-y: auto;
}
       


        #tallModal .modal-body p { margin-bottom: 900px }
        
    </style>
</head>

<body id="page-top">

            

    <header>
        
        <div class="header-content">
            <div class="header-content-inner">                
                <a  class="btn btn-primary btn-xl page-scroll" data-toggle="modal" href="/Test2/donationform" >Donate</a>
                </br>
                </br>
                </br>
                <a  class="btn btn-primary btn-xl page-scroll" data-toggle="modal" href="#shortModal">Sign In</a>
            </div>
        </div>
        
        <div id="tallModal" class="modal modal-wide fade">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
        <h1 class="modal-title" id="donate" style="text-align:left; color:#f05f40;"><b>DONATE</b></h1>
      </div>
        
      <div class="modal-body">
            
  <form:form method="POST" action="/Test2/addDonation" modelAttribute="command" role="form">
        <div class="form-group">
          <form:label  path="name">Name:</form:label>  
          <form:input path="name" type="text" class="form-control" id="email" />
       </div>

        <div class="form-group">
          <form:label path="phone" >Phone:</form:label>
          <form:input path="phone" type="text" class="form-control" id="pwd" />
        </div>

        <div class="form-group">
          <form:label path="notes" >Notes:</form:label>
          <form:textarea path="notes" type="text" class="form-control" style="height:100px;" />
        </div>

        <div class="form-group">
              <form:input path="latitude" id="lat" type="hidden" step="any" />
              <form:input path="longitude" id="lon"  type="hidden" step="any" />
              <form:input path="time" id="time" type="hidden" />
        </div>



            </div>
            <div class="modal-footer">
                <button type="submit" class="btn btn-primary" id="submit">Save changes</button>
                  <button type="button" class="btn btn-default" data-dismiss="modal" id="close">Close</button> 
            </div>
        </form:form>
    </div><!-- /.modal-content -->
  </div><!-- /.modal-dialog -->
</div><!-- /.modal -->

<div id="shortModal" class="modal modal-wide fade">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
        <h1 class="modal-title" style=" color:#f05f40;"><b>Sign In</b></h1>
      </div>
      <div class="modal-body">
         <form:form method="POST"  role="form">
  <div class="form-group">
    <label for="email">Username</label>
    <spring:bind path="name">
        <input type="email" class="form-control" >
    </spring:bind>
  </div>
  <div class="form-group">
    <label for="pwd">Password</label>
    <spring:bind path="phone">
        <input type="password" class="form-control" >
    </spring:bind>
  </div>
               
      </div>
      <div class="modal-footer">
          <button type="button" class="btn btn-default" data-dismiss="modal" id="close">Close</button>
        <button type="submit" class="btn btn-primary" id="submit">Save changes</button>
      </div>
        </form:form>
      </div>
      
    </div><!-- /.modal-content -->
  </div><!-- /.modal-dialog -->
</div><!-- /.modal -->
    </header>

   
</body>

</html>

