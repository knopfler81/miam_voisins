
  function drawMeAMap() {
    var handler = Gmaps.build('Google');
    handler.buildMap({ internal: { id: 'map' } });
    updateMarkers();
  };



  function updateMarkers(){
    alert("Yo! I upladed");

  };

// $(document).ready(function() {
//         var handler = Gmaps.build('Google');
//         handler.buildMap({ internal: { id: 'map' } }, function() {
//           markers = handler.removeMarkers(<%= raw @hash.to_json %>);
//         });
//         handler.buildMap({ internal: { id: 'map' } }, function() {
//           markers = handler.addMarkers(<%= raw @hash.to_json %>);
//           handler.bounds.extendWith(markers);
//           handler.fitMapToBounds();
//           if (markers.length == 0) {
//             handler.getMap().setZoom(2);
//           } else if (markers.length == 1) {
//             handler.getMap().setZoom(14);
//           }
//         });
//       });
