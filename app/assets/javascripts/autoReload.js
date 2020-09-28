$(function(){
  function buildHTML(message){
    if (message.user_image) {
      if (message.image) {
        let html = 
        `<div class="Message_box" data-message-id=${message.id}>
          <a href="/posts_g/${message.user_id}">
            <img class="Message_box__User_image" src="${message.user_image}">
          </a>
          <div class="Message_box__Content">
            <div class="Message_box__Content__Info">
              <div class="Message_box__Content__Info__Name">
                <a class="Text" href="/posts_g/${message.user_id}">${message.user_name}</a>
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
        `<div class="Message_box" data-message-id=${message.id}>
          <a href="/posts_g/${message.user_id}">
            <img class="Message_box__User_image" src="${message.user_image}">
          </a>
          <div class="Message_box__Content">
            <div class="Message_box__Content__Info">
              <div class="Message_box__Content__Info__Name">
                <a class="Text" href="/posts_g/${message.user_id}">${message.user_name}</a>
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
        `<div class="Message_box" data-message-id=${message.id}>
          <a href="/posts_g/${message.user_id}">
            <img class="Message_box__User_image" src="/assets/no-image.jpg">
          </a>
          <div class="Message_box__Content">
            <div class="Message_box__Content__Info">
              <div class="Message_box__Content__Info__Name">
                <a class="Text" href="/posts_g/${message.user_id}">${message.user_name}</a>
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
        `<div class="Message_box" data-message-id=${message.id}>
          <a href="/posts_g/${message.user_id}">
            <img class="Message_box__User_image" src="/assets/no-image.jpg">
          </a>
          <div class="Message_box__Content">
            <div class="Message_box__Content__Info">
              <div class="Message_box__Content__Info__Name">
                <a class="Text" href="/posts_g/${message.user_id}">${message.user_name}</a>
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

  let reloadMessages = function() {
    let last_message_id = $('.Message_box:last').data("message-id") || 0;
    $.ajax({
      url: "api/messages",
      type: 'get',
      dataType: 'json',
      data: {id: last_message_id}
    })
    .done(function(messages) {
      if (messages.length !== 0) {
        let insertHTML = '';
        $.each(messages, function(i, message) {
          insertHTML += buildHTML(message)
        });
        $('.Main_chat__Wrapper').append(insertHTML);
        $('.Main_chat').animate({ scrollTop: $('.Main_chat')[0].scrollHeight});
      }
    })
    .fail(function() {
      alert('error');
    });
  };
  setInterval(reloadMessages, 7000);
});