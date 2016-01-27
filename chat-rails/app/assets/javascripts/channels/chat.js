App.chat = App.cable.subscriptions.create("ChatChannel", {
  received: function(data) {
    return $('#messages').append(data.message);
  },
  speak: function(msg) {
    return this.perform('speak', {
      message: msg
    });
  }
});

$(document).on('click', '#new-message', function(event) {
  App.chat.speak($('#chat-speak').val());
  return event.preventDefault();
});