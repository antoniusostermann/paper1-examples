class CheckoutTask < Volt::Task
  def execute(item_ids)
    current_order = Order.new
    store.orders << current_order

    item_ids.each do |item_ids|
      store.order_positions << OrderPosition.new(order: current_order, item_id: item_ids)
    end

    Volt.current_app.message_bus.publish('public:order_placed', 'order_placed')
    # hopefully this is not needed in future anymore
    Volt.current_app.message_bus.trigger!('public:order_placed', 'order_placed')

    true
  end
end