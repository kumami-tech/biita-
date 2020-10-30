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
    $(".User_favorite_posts").removeClass("Show2").eq(index).addClass("Show2");
  }
  tabs.click(tabSwitch);
});


// プロフィール画像のプレビュー

document.addEventListener('DOMContentLoaded', () => {
  const input = document.getElementById('user_profile_image');
  const preview = document.getElementById('Img_prev');

  input.addEventListener('change', e => {
    const file = e.target.files[0];

    if (file.type.match(/image\/*/)) {
      const reader = new FileReader();
      reader.addEventListener('load', e => {
        preview.setAttribute('src', e.target.result)
      });
      reader.readAsDataURL(file);
    }
    else {
      alert("画像ファイルを指定してください。");
      return false;
    }
  });
});