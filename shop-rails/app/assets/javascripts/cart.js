$(function(){
  $(".cart-adder").click(function(){
    $("#checkout-form").append("<input type='hidden' name='cart[]' value='"+ $(this).data('item-id') +"'></input>");

    item_title = $(this).parent().find('.item-title').html();
    item_price = $(this).parent().find('.item-price').html();
    $("#current-cart").append('1x '+ item_title +' ($'+ item_price +')<br>');

    $('#cart-sum').html(Number($('#cart-sum').html()) + Number(item_price));
  });
});