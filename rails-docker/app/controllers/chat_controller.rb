class ChatController < ApplicationController
skip_before_action :verify_authenticity_token
  def index
    @chat = Chat.find_by(application_id:Applications.find_by(token:params[:application_token]).id)
    render :plain => @chat
  end
  def create
    @chat = Chat.new
    @chat.applications=Applications.find_by(token:params[:application_token])
    ActiveRecord::Base.transaction do
      @chat.applications.lock!
      @chat.save
      @chat.applications.save!
      # Resque.enqueue(Sleeper)
      flash[:notice] = "Chat was created."
      render :plain => @chat.chat_number
   end   
  end
end