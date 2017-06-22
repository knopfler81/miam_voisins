
$(function(){
  $('#normal-choice input').on('click', function(event) {
    var url = '/meals?'
    $.ajax({
      type: "GET",
      url: url,
      data:  $('.normal-form').serialize(),
      success: function(data) {
        $('.meals-normal').replaceWith($(data).find('.meals-normal').parent().html());
        //drawMeAMap(markerJson);

        history.replaceState({}, "meals", url);
      },

      error: function(jqXHR) {
        console.error(jqXHR.responseText);
      }
    });
  });

});

