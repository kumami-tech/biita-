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

});