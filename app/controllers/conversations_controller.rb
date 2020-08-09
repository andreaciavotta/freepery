class ConversationsController < ApplicationController
  before_action :authenticate_account!
  before_action :isAdmin, only: [:secret]


  def index
    @accounts = Account.all
    @conversations = Conversation.all
  end

  def secret
    @accounts = Account.all
    @conversations = Conversation.all
    @conversation_count = Conversation.all.count
  end


  def create
    if Conversation.between(params[:sender_id], params[:recipient_id]).present?
      @conversation = Conversation.between(params[:sender_id], params[:recipient_id]).first
    else
      @conversation = Conversation.create!(conversation_params)
    end
    redirect_to conversation_messages_path(@conversation)
  end

  private
    def conversation_params
      params.permit(:sender_id, :recipient_id)
    end

    def isAdmin
        unless current_account.has_role?(:admin)
            redirect_to root_path
        end
    end

end
