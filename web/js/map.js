//<![CDATA[
function myMap() {
	var myCenter = new google.maps.LatLng(42.3689107,13.3494623);
	var mapCanvas = document.getElementById("map");
	var mapOptions = {center: myCenter, zoom: 12};
	var map = new google.maps.Map(mapCanvas, mapOptions);

	var marker = new google.maps.Marker({position:myCenter});
	marker.setMap(map);
}

//]]>
