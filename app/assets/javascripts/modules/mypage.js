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
  const allContents = document.querySelectorAll('[data-content]');

  for (let i = 0; i < tabs.length; i++) {
    tabs[i].addEventListener('click', e => {

      for (let j = 0; j < tabs.length; j++) {
        tabs[j].classList.remove('Active2')
        for (let k = 0; k < allContents.length; k++) {
          allContents[k].classList.remove('Show2')
        }
      }
      tabs[i].classList.add('Active2')

      for (let k = 0; k < allContents.length / tabs.length; k++) {
        const contents = document.querySelectorAll('[data-content="' + k + '"]');
        contents[i].classList.add('Show2')
      }
    });
  }
});