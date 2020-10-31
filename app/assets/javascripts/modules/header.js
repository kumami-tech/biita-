document.addEventListener('DOMContentLoaded', () => {
  const menus = document.querySelectorAll('.Menu')
  const headerBtns = document.querySelectorAll('.Header_btn')
  const menuBtns = document.querySelectorAll('.Menu_btn')

  for (let i = 0; i < menus.length; i++) {
    document.addEventListener('click', () => {
      menus[i].style.display = 'none'
    })
  }
  for (let i = 0; i < headerBtns.length; i++) {
    headerBtns[i].addEventListener('click', (e) => {
      e.stopPropagation();
    })
  }
  for (let i = 0; i < menuBtns.length; i++) {
    menuBtns[i].addEventListener('click', () => {
      for (let j = 0; j < menuBtns.length; j++) {
        menus[j].style.display = 'none'
      }
      menus[i].style.display = 'block'
    })
  }

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