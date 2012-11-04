var gauges;
var gauge_markers = [];

$(document).ready(function() {

$.getJSON('gauges.json', {}, function(data) {
	gauges = data;

	for (i = 0; i < gauges.length; i++) {
		var pos = new google.maps.LatLng(gauges[i].lat, gauges[i].lng);
		
		var new_marker = new google.maps.Marker({
			id: "gauge_" + i,
			type: "gauge",
			position: pos,
			map: map,
			title: "Gauge " + gauges[i].code
		});
		gauge_markers.push(new_marker);
	}
});

});