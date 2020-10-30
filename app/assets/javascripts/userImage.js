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