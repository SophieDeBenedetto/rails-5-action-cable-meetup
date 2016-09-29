class MessageBroadCastJob < ApplicationJob
  def preform(message)
    ActionCable.server.broadcast("messages", messages_html(message))
  end

  def messages_html(msg)
    ApplicationController.renderer.render(partial: 'messages/message', locals: { message: msg }) 
  end
end