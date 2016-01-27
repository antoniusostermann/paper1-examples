class ItemsController < ApplicationController
  def index
    prepare_seeds
  end

  def admin
  end

  def order_placed(order)
    ActionCable.server.broadcast('orders',
      order: render_order(order))
  end

  def checkout
    order = Order.create
    params[:cart].each do |item|
      ItemsOrder.create item: Item.find(item), order: order
    end

    order_placed(order)

    head :ok
  end

  private

  def prepare_seeds
    if Item.count == 0
      Item.create({title: "A pair of socks", price: 1.5})
      Item.create({title: "Shorts", price: 5})
    end
  end

  def render_order(order)
    ApplicationController.render(partial: 'items/order',
                                 locals: { order: order })
  end
end