$(function(){
  function buildHTML(message){
    if (message.user_image) {
      if (message.image) {
        let html = 
        `<div class="Message_box">
          <a href="/posts_g/${message.user_id}">
            <img class="Message_box__User_image" src="${message.user_image}">
          </a>
          <div class="Message_box__Content">
            <div class="Message_box__Content__Info">
              <div class="Message_box__Content__Info__Name">
                <a class="Link Text" href="/posts_g/${message.user_id}">${message.user_name}</a>
              </div>
              <div class="Message_box__Content__Info__Time Text_s">
                ${message.created_at}
              </div>
            </div>
            <div class="Message_box__Content__Message Text">
              <p>${message.text}</p>
              <img class="Message__image" src="${message.image}">
            </div>
          </div>
        </div>`
        return html;
      } else {
        let html =
        `<div class="Message_box">
          <a href="/posts_g/${message.user_id}">
            <img class="Message_box__User_image" src="${message.user_image}">
          </a>
          <div class="Message_box__Content">
            <div class="Message_box__Content__Info">
              <div class="Message_box__Content__Info__Name">
                <a class="Link Text" href="/posts_g/${message.user_id}">${message.user_name}</a>
              </div>
              <div class="Message_box__Content__Info__Time Text_s">
                ${message.created_at}
              </div>
            </div>
            <div class="Message_box__Content__Message Text">
              <p>${message.text}</p>
            </div>
          </div>
        </div>`
        return html;
      };
    } else {
      if (message.image) {
        let html = 
        `<div class="Message_box">
          <a href="/posts_g/${message.user_id}">
            <img class="Message_box__User_image" src="no-image.jpeg">
          </a>
          <div class="Message_box__Content">
            <div class="Message_box__Content__Info">
              <div class="Message_box__Content__Info__Name">
                <a class="Link Text" href="/posts_g/${message.user_id}">${message.user_name}</a>
              </div>
              <div class="Message_box__Content__Info__Time Text_s">
                ${message.created_at}
              </div>
            </div>
            <div class="Message_box__Content__Message Text">
              <p>${message.text}</p>
              <img class="Message__image" src="${message.image}">
            </div>
          </div>
        </div>`
        return html;
      } else {
        let html =
        `<div class="Message_box">
          <a href="/posts_g/${message.user_id}">
            <img class="Message_box__User_image" src="no-image.jpeg">
          </a>
          <div class="Message_box__Content">
            <div class="Message_box__Content__Info">
              <div class="Message_box__Content__Info__Name">
                <a class="Link Text" href="/posts_g/${message.user_id}">${message.user_name}</a>
              </div>
              <div class="Message_box__Content__Info__Time Text_s">
                ${message.created_at}
              </div>
            </div>
            <div class="Message_box__Content__Message Text">
              <p>${message.text}</p>
            </div>
          </div>
        </div>`
        return html;
      };
    }
  }

  $('.Main__form__Form').on('submit', function(e){
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
      $('.Main__content').append(html);
      $('.Main__content').animate({ scrollTop: $('.Main__content')[0].scrollHeight});
      $('form')[0].reset();
      $('.Main__form__contents__btn').prop('disabled', false);
    })
    .fail(function() {
      alert("メッセージ送信に失敗しました");
      $('.Main__form__contents__btn').prop('disabled', false);
    })
  });
});