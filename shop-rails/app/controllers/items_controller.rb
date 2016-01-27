class ItemsController < ApplicationController
  def index
    prepare_seeds
  end

  def admin
  end

  def checkout
    order = Order.create
    params[:cart].each do |item|
      ItemsOrder.create item: Item.find(item), order: order
    end
    flash[:notice] = "success"

    redirect_to root_path
  end

  private

  def prepare_seeds
    if Item.count == 0
      Item.create({title: "A pair of socks", price: 1.5})
      Item.create({title: "Shorts", price: 5})
    end
  end
end