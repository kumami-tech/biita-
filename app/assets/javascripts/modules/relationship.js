document.addEventListener('DOMContentLoaded', () => {
  const tabs = document.querySelectorAll('.Follow_tab');
  const contents = document.querySelectorAll('.Follow_list');

  for (let i = 0; i < tabs.length; i++) {
    tabs[i].addEventListener('click', e => {
      for (let j = 0; j < tabs.length; j++) {
        tabs[j].classList.remove('Active')
        contents[j].classList.remove('Show')
      }
      tabs[i].classList.add('Active');
      contents[i].classList.add('Show');
    });
  }
});