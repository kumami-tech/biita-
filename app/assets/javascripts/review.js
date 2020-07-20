$(function(){
  function buildHTML(review){
  let html = `<div class="Message_box">
                <div class=" Message_box__User_image">
                  ${review.user.profile_image}
                </div>
                <div class="Message_box__Content">
                  <a class="Link Text Message_box__Content__Name" href="/posts_g/8">${review.user_name}</a>
                  <div class="Message_box__Text Text">
                    ${review.content}
                  </div>
                </div>
              </div>`
  return html;
  }
  $('.New_r').on('submit', function(e){
    e.preventDefault();
    let formData = new FormData(this);
    let url = $(this).attr('action');
    $.ajax({
      url: url,
      type: 'POST',
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
    .fail(function() {
      console.log('error');
    });
  })
})

// $(function(){
//   function buildHTML(review){
//   let haml = 
//   `.Message_box
//     = attachment_image_tag @user, :profile_image, fallback: "no-image.jpg", class: "Message_box__User_image"
//     .Message_box__Content
//       = link_to ${review.user_name}, posts_g_path(${review.user_id}), class: "Link Text Message_box__Content__Name"
//       .Message_box__Text.Text
//         = simple_format(${review.content})`
//    return haml;
//    }
//   $('#New_r').on('submit', function(e){
//     e.preventDefault();
//     let formData = new FormData(this);
//     let url = $(this).attr('action')
//     $.ajax({
//       url: url,
//       type: "POST",
//       data: formData,
//       dataType: 'json',
//       processData: false,
//       contentType: false
//     })
//     .done(function(data){
//       let haml = buildHTML(data);
//       $('.Reviews').append(html);
//       $('.Textbox_r').val('');
//       $('.Submit_r').prop('disabled', false);
//     })
//   })
// })


{/* <img class="attachment user profile_image Message_box__User_image" src="/attachments/a11b74cf4b391cc0d6ae8e8cc0180164e5a178c6/store/4360ef900099ff983a197d851e902b57f1dd2199e9c73a5165f84d99f4e2/profile_image"> */}
{/* <img class=" Message_box__User_image" src=${review.user.profile_image}> */}
