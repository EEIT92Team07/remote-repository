<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd"> 
<html>
  <head>
    <style type="text/css">
      html, body { height: 100%; margin: 0; padding: 0; }
      #map { height: 100%; }
    </style>
  </head>
  <body>
  <script type="text/javascript" src="/js/jquery-3.1.1.js"></script>
  <script type="text/javascript" src="/js/jquery-3.1.1.min.js"></script>
    <div id="map"></div>
    <script type="text/javascript">
     
     function initMap() {
    	
         var mymap={lat: 21.945904, lng: 120.790070};
       map = new google.maps.Map(document.getElementById('map'), {
         center: mymap,
         zoom: 13,
       });
       var myLatLng = {lat: 21.901970, lng: 120.852852};
       var myLatLng1 = {lat: 21.991785, lng: 120.746649};
       var myLatLng2= {lat: 21.945257, lng: 120.797974};
       var map;
       var marker = new google.maps.Marker({
           position: myLatLng,
           map: map,
           title: 'Hello World!'
         });
         var marker = new google.maps.Marker({
       	    position: myLatLng1,
       	    map: map,
       	    title: 'Hello World!'
       	  });
         var marker = new google.maps.Marker({
       	    position: myLatLng2,
       	    map: map,
       	    title: 'Hello World!'
       	  });
     }



    </script>
<!--     引用google api -->
    <script async defer
      src="https://maps.googleapis.com/maps/api/js?key=AIzaSyAsTC5dBCsI0Ufiizw1Phs6xSJ2K_Lw_L4&callback=initMap">
    </script>
    
  </body>
</html>