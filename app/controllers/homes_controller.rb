class HomesController < ApplicationController
  def index
    session[:conversations] ||= []
 
    @users = User.all.where.not(id: current_user)
    puts @users
    @conversations = Conversation.includes(:recipient, :messages)
                                 .find(session[:conversations])
  end
end
