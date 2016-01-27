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
      CheckoutTask.execute(_cart_items.map(&:_id)).then do
        flash._successes << "Your order has been saved"
      end
    end

    def sum
      _cart_items.map(&:_price).reduce(:+)
    end

    # -- admin

    def admin
      Volt.current_app.message_bus.on('public:order_placed') do |order|
        flash._successes << "New order placed!"
      end
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