module Main
  class MainController < Volt::ModelController
    model :page

    def index
      boot_seeds
      _cart_items = []
    end

    def add_to_cart(item)
      _cart_items << item
    end

    def checkout
      current_order = Order.new
      store.orders << current_order

      _cart_items.each do |item|
        store.order_positions << OrderPosition.new(order: current_order, item: item)
      end

      flash._successes << "New order placed!"
    end

    def sum
      _cart_items.map(&:_price).reduce(:+)
    end

    # -- admin

    def admin
    end

    private

    def boot_seeds
      store._items.count.then do |item_count|
        if item_count == 0
          store._items << Item.new({title: "A pair of socks", price: 1.5})
          store._items << Item.new({title: "Shorts", price: 5})
        end
      end
    end

    def main_path
      "#{params._component || 'main'}/#{params._controller || 'main'}/#{params._action || 'index'}"
    end
  end
end