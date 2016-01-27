App.order = App.cable.subscriptions.create("OrderChannel", {


  received: function(data) {
    alert("New order received!");
    return $('#orders').append(data.order);
  }
});