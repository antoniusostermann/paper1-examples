class OrderPosition < Volt::Model
  belongs_to :order
  belongs_to :item
end