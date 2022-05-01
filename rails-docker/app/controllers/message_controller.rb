class MessageController < ApplicationController
skip_before_action :verify_authenticity_token
  def index
    @msg = Message.find_by(chat_id:Chat.find_by(chat_number:params[:chat_number]).id)
    render :plain => @msg
  end
  def create
    @msg = Message.new(permitted_parameters)
    @msg.chats=Chat.find_by(chat_number:params[:chat_number])
    ActiveRecord::Base.transaction do
      @msg.chats.lock!
      @msg.save
      @msg.chats.save!
      # Resque.enqueue(Sleeper)
      flash[:notice] = "Message was created."
      render :plain => @msg.message_number
  end

  def permitted_parameters
    params.require(:message).permit(:message_body)
  end
end