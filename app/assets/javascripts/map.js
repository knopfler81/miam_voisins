var handler = Gmaps.build('Google');


$(document).on('ready', function() {
  if ($('#map').length > 0) {
    var markerJson = $('#map').data('markers');
    drawMeAMap(markerJson);
  }
});

function drawMeAMap(markerJson){
  $('#map').html('');
  handler.buildMap(
    {
      internal: { id: 'map' }

    },
    addMarkers(markerJson),
  );
};

function updateMarkers(){
  removeMarkers();
  addMarkers();

};

function removeMarkers(markerJson){
  handler.buildMap({ internal: { id: 'map' } }, function() {
    markers = handler.removeMarkers(markerJson);
    });
};

function addMarkers(markerJson){
  handler.buildMap({ internal: { id: 'map' } }, function() {
    markers = handler.addMarkers(markerJson);
    handler.bounds.extendWith(markers);
    handler.fitMapToBounds();
    if (markers.length == 0) {
      handler.getMap().setZoom(2);
    } else if (markers.length == 1) {
      handler.getMap().setZoom(14);
    }
  });
};


