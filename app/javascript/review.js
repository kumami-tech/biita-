$(function(){
  function buildHTML(review){
    let html = 
    `<div class="Message_box" data-review-id=${review.id}>
    `
    return html;
  }
  $('#New_r').on('submit', function(e){
    e.preventDefault();
    let formData = new FormData(this);
    let url = $(this).attr('action')
    $.ajax({
      url: url,
      type: "POST",
      data: formData,
      dataType: 'json',
      processData: false,
      contentType: false
    })
    .done(function(data){
      let html = buildHTML(data);
      $('.Reviews').append(html);
      $('.Textbox_r').val('');
      $('.Submit_r').prop('disabled', false);
    })
  })
})