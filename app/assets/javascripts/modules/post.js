$(function(){
  $('form').on('change', 'input[type="file"]', function(e) {
    const file = e.target.files[0],
        reader = new FileReader(),
        $preview = $(".Post_image_prev");

    if(file.type.indexOf("image") < 0){
      return false;
    }

    reader.onload = (function(file) {
      return function(e) {
        $preview.empty();
        $preview.append($('<img>').attr({
                  src: e.target.result,
                  class: "Post_image",
              }));
      };
    })(file);

    reader.readAsDataURL(file);
  });
});
