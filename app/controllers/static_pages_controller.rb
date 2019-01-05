class StaticPagesController < ApplicationController
  def index
  end

  def contact
  end

  def help
  end

  def home
    @currentUser = current_user.id
    @messages_received = Message.where(:receiver => @currentUser)
    @messages_sent=Message.where(:sender => @currentUser)
  end

  def about
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_message
  end
end
