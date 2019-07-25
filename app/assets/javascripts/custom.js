$(document).ready(function(){
  $(":checkbox").on("change", function(){
    if($(this).is(':checked'))
      $(this).parent().css('background-color','brown');
    else
      $(this).parent().css('background-color', '');
  });
  $('.multiple-items').slick({
    infinite: true,
    arrows: true,
    prevArrow:"<button type='button' class='slick-prev pull-left'><i class='fa fa-angle-left' aria-hidden='true'></i></button>",
    nextArrow:"<button type='button' class='slick-next pull-right'><i class='fa fa-angle-right' aria-hidden='true'></i></button>",
    slidesToShow: 4,
    slidesToScroll: 4
  });
})
