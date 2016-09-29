class Message < ApplicationRecord
  belongs_to :chatroom
  belongs_to :user
  after_create { MessageBroadCastJob.preform_now(self) }

  # def broadcast_message
  #   messages_html = ApplicationController.renderer.render(partial: 'messages/message', locals: { message: self }) 
  #   ActionCable.server.broadcast("messages", messages_html)
  # end
end
