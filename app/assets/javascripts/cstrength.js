$(document).ready(function(){
  $('.cstrength-container').on('mouseover', function(){
    $(this).css("background-color", "rgba(255,255,255,1.0");
    $(this).find('.tag-name').css("color", "black");
  });
  $('.cstrength-container').on('mouseleave', function(){
    $(this).css("background-color", "transparent");
    $(this).find('.tag-name').css("color", "white");
  })
});
