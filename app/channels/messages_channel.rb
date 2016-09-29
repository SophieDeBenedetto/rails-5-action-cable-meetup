class MessagesChannel < ApplicationCable::Channel  
  def subscribed
    stream_from 'messages'
  end

  def receive(payload)
    message = Message.create(content: payload["message"], chatroom_id: payload["chatroom_id"], user: current_user)
    # messages_html = ApplicationController.renderer.render(partial: 'messages/message', locals: { message: message }) 
    # ActionCable.server.broadcast("messages", messages_html)
  end
end  
