// ########  TEST 1 ################
$(function(){
  $('#normal-choice input').on('click', function(event) {
    var url = '/meals?'
    $.ajax({
      type: "GET",
      url: url,
      data:  $('.normal-form').serialize(),
      success: function(data) {
        $('.meals-normal').replaceWith($(data).find('.meals-normal').parent().html());

        //$("#map").updateMarkers();
        history.replaceState({}, "meals", url);
      },

      error: function(jqXHR) {
        console.error(jqXHR.responseText);
      }
    });
  });
});


//######## TEST 2 ################

// $(function(){
//   $('#normal-choice input').on('click', function(event) {
//     var url = '/meals?' + $('.normal-form').serialize();
//     $.ajax({
//       type: "GET",
//       url: url,
//       success: function(data) {
//         $('.meals-normal').replaceWith($(data).find('.meals-normal').parent().html()),
//         //'#body').updateMarkers(data);
//         //$("#map").replaceWith($(data)).updateMarkers(markerJson);

//         history.replaceState({}, "meals", url);
//       },

//       error: function(jqXHR) {
//         console.error(jqXHR.responseText);
//       }
//     });
//   });
// });

//########  TEST 3 ################

// $(function(){

//   $('#normal-choice input').on('click', function(event) {
//     var url = '/meals?' + $('.normal-form').serialize();
//     $.ajax({
//       type: "GET",
//       url: url,
//       success: function(data) {
//        $("#body").replaceWith($(data)).updateMarkers(markerJson);




//         history.replaceState({}, "meals", url);
//       },

//       error: function(jqXHR) {
//         console.error(jqXHR.responseText);
//       }
//     });
//   });
// });

