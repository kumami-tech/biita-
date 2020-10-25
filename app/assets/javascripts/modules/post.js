$(function(){
  $('form').on('change', 'input[type="file"]', function(e) {
    const preview = $(".Post_image_prev");
    const file = e.target.files[0];
    const reader = new FileReader();

    if(file.type.indexOf("image") < 0){
      alert("画像ファイルを指定してください。");
      return;
    }

    reader.onload = (function(file) {
      return function(e) {
        preview.html($('<img>').attr({
          src: e.target.result,
          class: "Post_image",
        }));
      };
    })(file);

    reader.readAsDataURL(file);
  });
});
