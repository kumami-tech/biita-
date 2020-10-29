window.addEventListener('DOMContentLoaded', () => {
  const input = document.getElementById('Post_image_input');
  const preview = document.getElementById('Post_image_prev');

  input.addEventListener('change', event => {
    const file = event.target.files[0];

    if (file.type.match(/image\/*/)) {
      const reader = new FileReader();
      reader.addEventListener('load', event => {
        preview.innerHTML = '<img src="' + event.target.result + '">';
      });
      reader.readAsDataURL(file);
    }
    else {
      alert("画像ファイルを指定してください。");
      input.value = '';
      return false;
    }
  });
});
