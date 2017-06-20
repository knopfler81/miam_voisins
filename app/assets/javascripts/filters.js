$(function(){

  $('#normal-choice input').on('click', function(event) {
    var url = '/meals?' + $('.normal-form').serialize();
    $.ajax({
      type: "GET",
      url: url,
      success: function(data) {
        $('.meals-normal').replaceWith($(data).find('.meals-normal').parent().html());
        history.replaceState({}, "meals", url);
        updateMarkers();


      },

      error: function(jqXHR) {
        console.error(jqXHR.responseText);
      }
    });
  });


});

