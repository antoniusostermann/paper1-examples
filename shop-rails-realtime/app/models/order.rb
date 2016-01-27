class Order < ActiveRecord::Base
  has_many :items_orders
end