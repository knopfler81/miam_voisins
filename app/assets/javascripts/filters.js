$(function(){

  $('#normal-choice input').on('click', function(event) {
    var url = '/meals?' + $('.normal-form').serialize();
    $.ajax({
      type: "GET",
      url: url,
      success: function(data) {
        $('.meals-normal').replaceWith($(data).find('.meals-normal').parent().html());
        $('#map').replaceWith($(data)).find('#map').updateMarkers(markerJson);

        history.replaceState({}, "meals", url);
      },

      error: function(jqXHR) {
        console.error(jqXHR.responseText);
      }
    });
  });


});


