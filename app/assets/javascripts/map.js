      var vehicleMarker;
      var map;
      var vehicle_number;
      function update() {
        var xmlHttp = null;
        xmlHttp = new XMLHttpRequest();
        xmlHttp.open( "GET", "/vehicles/"+vehicle_number+".json", true ); //js is necessary anyway
        
        xmlHttp.onreadystatechange = function() {//Call a function when the state changes.
	        if(xmlHttp.readyState == 4 && xmlHttp.status == 200) {
	    	    //alert(xmlHttp.responseText);
	    	    var jData = JSON.parse(xmlHttp.responseText);
	    	    
	    	    document.getElementById('current_latitude').innerHTML = '<b>Current Latitude: </b>' + jData.location.latitude;
                document.getElementById('current_longitude').innerHTML = '<b>Current Longitude: </b>' + jData.location.longitude;
                document.getElementById('created_at').innerHTML = '<b>Created At: </b>' + jData.location.created_at; //need to fix formatting (random chars)
                
                var newLatLng = new google.maps.LatLng(jData.location.latitude, jData.location.longitude);
                vehicleMarker.setPosition(newLatLng);
                map.setCenter(newLatLng);
	            
	        }
        }
        xmlHttp.send( null );
    }
    
    function map(init_lat, init_long, v_number) {
            vehicle_number = v_number;
            //initialize empty map, vehicle marker
            var myLatLng = new google.maps.LatLng(init_lat, init_long);
            var options = {
                center: myLatLng,
                zoom: 15,
                mapTypeId: google.maps.MapTypeId.ROADMAP
            };
            map = new google.maps.Map(document.getElementById("map_canvas"),options);
            //var image = 'vehicleImage.png';  
            vehicleMarker = new google.maps.Marker({
                position: myLatLng,
                map: map,
               //icon: image
            });
            
            //update view
            var t=setInterval("update()",500); 

    }
