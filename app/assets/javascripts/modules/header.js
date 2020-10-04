$(function() {
  $(document).click(function() {$('.Menu').hide();});
  $('.Header_btn').click(function() {event.stopPropagation();});

  $("#Post_btn").click(function() {
    $('#User_menu').hide();
    $("#Post_menu").toggle();
  })
  $("#Header_user_image").click(function() {
    $('#Post_menu').hide();
    $("#User_menu").toggle();
  })

  // レスポンシブ

  $("#Post_btn_s").click(function() {
    $('#Search_menu').hide();
    $('#Menu_logout').hide();
    $('#Menu_login').hide();
    $("#Post_menu_s").toggle();
  })

  $("#Search_btn").click(function() {
    $("#Post_menu_s").hide();
    $('#Menu_logout').hide();
    $('#Menu_login').hide();
    $("#Search_menu").toggle();
  })

  $("#Menu_btn").click(function() {
    $("#Post_menu_s").hide();
    $('#Search_menu').hide();
    $("#Menu_logout").toggle();
  })
  
  $("#Header_user_image_s").click(function() {
    $("#Post_menu_s").hide();
    $('#Search_menu').hide();
    $("#Menu_login").toggle();
  })
});