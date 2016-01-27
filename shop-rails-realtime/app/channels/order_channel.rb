class OrderChannel < ApplicationCable::Channel
  def subscribed
    stream_from 'orders'
  end
end