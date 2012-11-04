$(document).ready(function() {

	if ($('#pickermap').length > 0) {
		loadPickerMap();
	}
	
	var mapOptions = {
		zoom: 10,
		mapTypeId: google.maps.MapTypeId.TERRAIN,
		center: new google.maps.LatLng(-34.397, 150.644)
	};
	map = new google.maps.Map(document.getElementById('map_canvas'), mapOptions);
	console.log('map loaded');
	
	// Try HTML5 geolocation
	if(navigator.geolocation) {
		navigator.geolocation.getCurrentPosition(function(position) {
			var pos = new google.maps.LatLng(position.coords.latitude, position.coords.longitude);
			map.setCenter(pos);
		});
	};
	
	$('.dropdown-toggle').dropdown();

});

var centerMarker = new google.maps.Marker({
	map: null
});

/* Map for picking a latitude and longitude for php input */
function loadPickerMap() {
	var latVal, lngVal;
	
	// set up map
	var pickermapOptions = {
		zoom: 10,
		mapTypeId: google.maps.MapTypeId.TERRAIN,
	};
	var pickermap = new google.maps.Map(document.getElementById('pickermap'), pickermapOptions);
	// geolocation
	if(navigator.geolocation) {
		navigator.geolocation.getCurrentPosition(function(position) {
			var pos = new google.maps.LatLng(position.coords.latitude, position.coords.longitude);
			pickermap.setCenter(pos);
		});
	} else {
		pickermap.setCenter(new google.maps.LatLng(-34.397, 150.644));
	};
	
	// add centermarker
	centerMarker.setMap(pickermap);
	
	// keep text fields updated when map is changed
	google.maps.event.addListener(pickermap, 'click', function(event) {
		centerMarker.setPosition(event.latLng);
		pickermap.panTo(event.latLng);
		latVal = event.latLng.lat();
		lngVal = event.latLng.lng()
		$('.lat_input').attr('value', Math.round(latVal * Math.pow(10, 10)) / Math.pow(10, 10));
		$('.lng_input').attr('value', Math.round(lngVal * Math.pow(10, 10)) / Math.pow(10, 10));
	});
	
	// keep centermarker and map updated when text fields are changed
	$('.lat_input').bind("propertychange keyup input paste", function(event){
		if (latVal != $(this).val()) {
			latVal = $(this).val();
			var newPos = new google.maps.LatLng(latVal, lngVal);
			centerMarker.setPosition(newPos);
			if (lngVal != "" && lngVal != null) {
				pickermap.panTo(newPos);
			}
		}
	});
	$('.lng_input').bind("propertychange keyup input paste", function(event){
		if (lngVal != $(this).val()) {
			lngVal = $(this).val();
			var newPos = new google.maps.LatLng(latVal, lngVal);
			centerMarker.setPosition(newPos);
			if (latVal != "" && latVal != null) {
				pickermap.panTo(newPos);
			}
		}
	});

}