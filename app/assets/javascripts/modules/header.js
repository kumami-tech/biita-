$(function() {
  $(document).click(function() {$('.Menu').hide();});
  $('.Header_btn').click(function() {event.stopPropagation();});

  $("#Post_btn").click(function() {
    $("#Post_menu").toggle();
  })
  $("#Header_user_image").click(function() {
    $("#User_menu").toggle();
  })

  // レスポンシブ

  $("#Post_btn_s").click(function() {
    $("#Post_menu_s").toggle();
  })

  $('#Post_btn_s').click(function() {event.stopPropagation();});

  $("#Search_btn").click(function() {
    $("#Search_menu").toggle();
  })

  $("#Menu_btn").click(function() {
    $("#Menu_logout").toggle();
  })
  
  $("#Header_user_image_s").click(function() {
    $("#Menu_login").toggle();
  })
});