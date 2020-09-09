// マイページのタブ切り替え

$(function() {
  let btns = $(".Post_type_btn");

  function btnSwitch() {
    $(".Active1").removeClass("Active1");
    $(this).addClass("Active1");
    const index = btns.index(this);
    $(".Mypage_lower__Content").removeClass("Show1").eq(index).addClass("Show1");
  }
  btns.click(btnSwitch);
});

$(function() {
  let tabs = $(".User_page_tab");

  function tabSwitch() {
    $(".Active2").removeClass("Active2");
    $(this).addClass("Active2");
    const index = tabs.index(this);
    $(".User_giving_posts").removeClass("Show2").eq(index).addClass("Show2");
    $(".User_taken_posts").removeClass("Show2").eq(index).addClass("Show2");
    $(".User_taking_posts").removeClass("Show2").eq(index).addClass("Show2");
  }
  tabs.click(tabSwitch);
});


// プロフィール画像のプレビュー

$(function() {
  function readURL(input) {
    if (input.files && input.files[0]) {
      var reader = new FileReader();
      reader.onload = function (e) {
        $('.Img_prev').attr('src', e.target.result);
      }
      reader.readAsDataURL(input.files[0]);
    }
  }
  $("#user_profile_image").change(function(){
    readURL(this);
  });
 });