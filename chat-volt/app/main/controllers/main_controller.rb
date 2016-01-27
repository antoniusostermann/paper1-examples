module Main
  class MainController < Volt::ModelController
    model :page

    def index
      Volt.current_app.message_bus.on('public:new_message') do |msg|
        `$('#chat-messages').append(#{msg} + '<br>');`
      end
    end

    def add_message
      Volt.current_app.message_bus.publish('public:new_message', _new_message)
    end
  end
end