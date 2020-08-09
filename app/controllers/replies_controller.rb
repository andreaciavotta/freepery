class RepliesController < ApplicationController
  before_action :authenticate_account!
  before_action :set_reply, only: [:edit, :update, :show, :destroy]
  before_action :set_post, only: [:create, :edit, :show, :update, :destroy]
  before_action :owned_reply, only: [:edit, :update, :destroy]

  def create
    @reply = @post.replies.create(params[:reply].permit(:reply, :post_id))
    @reply.account_id = current_account.id

    if @reply.save
        create_notification(@post)
        respond_to do |format|
            format.html { redirect_to post_path(@post) }
            format.js # renders create.js.erb
        end
    else
        format.html { redirect_to post_path(@post), notice: "Commento non inserito, riprova."}
        format.js
    end
  end

  def new
  end

  def destroy
    @reply = @post.replies.find(params[:id])
    @reply.destroy
    redirect_to post_path(@post)
  end

  def edit
    @post = Post.find(params[:post_id])
    @reply = @post.replies.find(params[:id])
  end

  def update
    @reply = @post.replies.find(params[:id])
     respond_to do |format|
      if @reply.update(reply_params)
        format.html { redirect_to post_path(@post), notice: 'Commento modificato correttamente' }
      else
        format.html { render :edit }
        format.json { render json: @reply.errors, status: :unprocessable_entity }
      end
    end
  end

  def show
  end

  private

  def set_post
    @post = Post.find(params[:post_id])
  end

  def set_reply
    @reply = Reply.find(params[:id])
  end

  def reply_params
    params.require(:reply).permit(:reply)
  end

  def owned_reply
        unless current_account == @reply.account || current_account.has_role?(:admin) || current_account == @reply.post.account
            flash[:alert] = "Non hai i privilegi necessari per accedere a questa funzione"
            redirect_to posts_path
        end
  end

  def create_notification(post)
    Notification.create(account_id: post.account.id, notified_by_id: current_account.id, post_id: post.id, notice_type: 'commentato')
  end

end

