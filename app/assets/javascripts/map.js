// var handler = Gmaps.build('Google');

// var markerJson = $('#map').data('markers');


// $(document).on('ready', function() {
//   if ($('#map').length > 0) {
//     drawMeAMap(markerJson);
//   }
// });

// function drawMeAMap(markerJson){
//   $('#map').html('');
//   handler.buildMap(
//     {
//       internal: { id: 'map' }

//     },
//     updateMarkers(markerJson),

//   );
// };


// function updateMarkers(markerJson){
//   //alert("Bonjour");

//   handler.buildMap({ internal: { id: 'map' } }, function() {
//      markers = handler.addMarkers(markerJson);
//      handler.removeMarkers(marker);
//     });
//   handler.buildMap({ internal: { id: 'map' } }, function() {
//     markers = handler.addMarkers(markerJson);
//     handler.bounds.extendWith(markers);
//     handler.fitMapToBounds();
//     if (markers.length == 0) {
//       handler.getMap().setZoom(2);
//     } else if (markers.length == 1) {
//       handler.getMap().setZoom(14);
//     }
//   });
// };


// function addMarkers(markerJson){
//   handler.buildMap({ internal: { id: 'map' } }, function() {
//     markers = handler.addMarkers(markerJson);
//     handler.bounds.extendWith(markers);
//     handler.fitMapToBounds();
//     if (markers.length == 0) {
//       handler.getMap().setZoom(2);
//     } else if (markers.length == 1) {
//       handler.getMap().setZoom(14);
//     }
//   });
// };
