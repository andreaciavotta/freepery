class MessagesController < ApplicationController
  before_action :find_conversation
  before_action :require_permission

  def index
    @messages = @conversation.messages

    if @messages.length > 10
      @over_ten = true
      @messages = @messages[-10..-1]
    end

    if params[:m]
      @over_ten = false
      @messages = @conversation.messages
    end

    @message = @conversation.messages.new
  end

  def create
    @message = @conversation.messages.new(message_params)
    if @message.save
      redirect_to conversation_messages_path(@conversation)
    end
  end

  def new
    @message = @conversation.messages.new
  end



  private

    def message_params
      params.require(:message).permit(:body, :account_id)
    end

    def find_conversation
      @conversation = Conversation.find(params[:conversation_id])
    end

    def require_permission
        unless current_account.id == Conversation.find(params[:conversation_id]).sender_id || current_account.id == Conversation.find(params[:conversation_id]).recipient_id || current_account.has_role?(:admin)
            redirect_to conversations_path
        end
    end

end
