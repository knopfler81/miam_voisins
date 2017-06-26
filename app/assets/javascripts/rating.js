$(document).ready(function(){
    $('#rating-form').raty({
      path: '/assets/',
      scoreName: 'review[rating]'
    });


    $('.review-rating').raty({
      readOnly: true,
      score: function() {
        return $(this).attr('data-score');
    },
      path: '/assets/'
  });


})
