App.messagesSubscription = App.cable.subscriptions.create('MessagesChannel', {  
  received: function(data) {
    debugger;
    $("#messages").removeClass('hidden')
    return $('#messages').append(data);
  },
  renderMessage: function(data) {
    return "<p> <b>" + data.user + ": </b>" + data.message + "</p>";
  }
});

$(document).on('turbolinks:load', function() {
  submitNewMessage();
});

function submitNewMessage(){
  $('textarea#message_content').keydown(function(event) {
    if (event.keyCode == 13) {
      debugger;
        var chatRoomId = $("[data-chatroom-id]").data().chatroomId
        App.messagesSubscription.send({message: event.target.value, chatroom_id: chatRoomId})
        // $('[data-send="message"]').click();
        $('[data-textarea="message"]').val(" ")
        return false;
     }
  });
}
