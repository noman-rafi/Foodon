<%-- 
    Document   : map
    Created on : May 14, 2015, 4:36:49 AM
    Author     : Noman Rafi
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>

<html>
  <head>
    <meta name="viewport" content="initial-scale=1.0, user-scalable=no">
    <meta charset="utf-8">
    <title>Simple markers</title>
    <!--script src="http://ajax.googleapis.com/ajax/libs/jquery/1.7/jquery.min.js"-->
    <script language="JavaScript" type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.7/jquery.min.js"></script>
    <link rel="stylesheet" href="<c:url value="resources/css/bootstrap.min.css"/>" type="text/css">
    <link rel="stylesheet" href="<c:url value="resources/css/font-awesome.min.css"/>" type="text/css">
    <link href="http://fonts.googleapis.com/css?family=Montserrat:400,700" rel="stylesheet" type="text/css">
    <link href="http://fonts.googleapis.com/css?family=Lato:400,700,400italic,700italic" rel="stylesheet" type="text/css">
    <style>
      html, body, #map-canvas {
        height: 100%;
        margin: 0px;
        padding: 0px
      }
      p{
          line-height: 14px;
      }
    </style>
    <script src="https://maps.googleapis.com/maps/api/js?v=3.exp&signed_in=true"></script>
    <script>
function initialize() {
       // var initial = geoLocation();
       // var initial = new google.maps.LatLng(33.6403,72.9863);
  
  var mapOptions = {
    zoom: 18,
  }
  var map = new google.maps.Map(document.getElementById('map-canvas'), mapOptions);
 
        navigator.geolocation.getCurrentPosition(function(position) {
      var initial = new google.maps.LatLng(position.coords.latitude,
                                       position.coords.longitude);
  map.setCenter(initial);});
  
var points = [], locData;

<c:forEach items="${donatetables}" var="don">
        locData={id:'${don.id}',nam:'${don.name}',phon:'${don.phone}',lat:${don.latitude},lon:${don.longitude},tim:'${don.time}',notes:'${don.notes}'};
        points.push(locData);
</c:forEach>
    var infoWindow = new google.maps.InfoWindow({ maxWidth: 300}), marker, i;
    var markers = {};
    for( i = 0; i < points.length; i++ ) {
  var myLatlng = new google.maps.LatLng(points[i]['lat'],points[i]['lon']);
  var marker = new google.maps.Marker({
      position: myLatlng,
      map: map,
      title: points[i]['nam']
  });
  //marker.metadata = {type: "point", id: points[i]['id']};
  markers[points[i]['id']] = marker;
  
  google.maps.event.addListener(marker, 'click', (function(marker, i) {
            return function() {
                var infoWindowContent = '<div class="info_content" style = "line-height : 14px">' +
        '<p><b style="font-size:17px">'+points[i]['nam']+'</b></p>' +'<p><b style="font-size:14px">'+points[i]['phon']+'</b></p>' +
        '<p><p><b style="font-size:14px">Notes:</b></p>'+points[i]['notes']+'</p> <button id="'+points[i]['id']+'" type="button">Done</button>' +'</div>';
                infoWindow.setContent(infoWindowContent);
                infoWindow.open(map, marker);
            }   
        })(marker, i));
        //map.fitBounds(bounds);
        //var id = points[i]['id'];
       

  }
   $("button").live("click",function(){
                marker = markers[this.id]; 
                marker.setMap(null);
                var id= {json:JSON.stringify(this.id)};
                $.ajax({
                    type : "POST",
                    url: "/Test2/deleteMarker",
                    data: id,
                    datatype: "json",
                })
        });
}
<!--/c:forEach-->
google.maps.event.addDomListener(window, 'load', initialize);

    </script>
  </head>
  <body>
      <nav class="navbar navbar-default navbar-fixed-top">
        <div class="container">
            <!-- Brand and toggle get grouped for better mobile display -->
            <div class="navbar-header page-scroll">
                <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1">
                    <span class="sr-only">Toggle navigation</span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                </button>
                <a class="navbar-brand" ><b>Foodon Maps</b></a>
            </div>

            <!-- Collect the nav links, forms, and other content for toggling -->
            <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
                <ul class="nav navbar-nav navbar-right">
                    <li class="hidden active">
                        <a href="#page-top"></a>
                    </li>
                    
                    <li class="page-scroll">
                        <a href="/Test2/">Signout</a>
                    </li>
                </ul>
            </div>
            <!-- /.navbar-collapse -->
        </div>
        <!-- /.container-fluid -->
    </nav>
    <div id="map-canvas"></div>
  </body>
</html>