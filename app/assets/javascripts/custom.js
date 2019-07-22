$(document).ready(function(){
  $(":checkbox").on("change", function(){
    if($(this).is(':checked'))
      $(this).parent().css('background-color','brown');
    else
      $(this).parent().css('background-color', '');
  });
})
