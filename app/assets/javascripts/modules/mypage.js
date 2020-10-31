// 左のボタン
document.addEventListener('DOMContentLoaded', () => {
  const btns = document.querySelectorAll('.Post_type_btn');
  const contents = document.querySelectorAll('.Mypage_lower__Content');

  for (let i = 0; i < btns.length; i++) {
    btns[i].addEventListener('click', e => {
      for (let j = 0; j < btns.length; j++) {
        btns[j].classList.remove('Active1')
        contents[j].classList.remove('Show1')
      }
      btns[i].classList.add('Active1');
      contents[i].classList.add('Show1');
    })
  }
});

// 上のタブ
document.addEventListener('DOMContentLoaded', () => {
  const tabs = document.querySelectorAll('.User_page_tab');
  const givingPosts = document.querySelectorAll('.User_giving_posts');
  const takenPosts = document.querySelectorAll('.User_taken_posts');
  const takingPosts = document.querySelectorAll('.User_taking_posts');
  const favoritePosts = document.querySelectorAll('.User_favorite_posts');

  for (let i = 0; i < tabs.length; i++) {
    tabs[i].addEventListener('click', e => {
      for (let j = 0; j < tabs.length; j++) {
        tabs[j].classList.remove('Active2')
        givingPosts[j].classList.remove('Show2')
        takenPosts[j].classList.remove('Show2')
        takingPosts[j].classList.remove('Show2')
        favoritePosts[j].classList.remove('Show2')
      }
      tabs[i].classList.add('Active2')
      givingPosts[i].classList.add('Show2')
      takenPosts[i].classList.add('Show2')
      takingPosts[i].classList.add('Show2')
      favoritePosts[i].classList.add('Show2')
    });
  }
});