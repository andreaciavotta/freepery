class PostsController < ApplicationController
  before_action :set_post, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_account!
  before_action :owned_post, only: [:edit, :update, :destroy]

  # GET /posts
  # GET /posts.json
  def index
    @posts = Post.all.order("created_at DESC")
    @post = Post.new
    @users = Account.all
  end

  def search
        @posts = Post.where("post LIKE ?", "%" + params[:q] + "%")
  end

  # GET /posts/1
  # GET /posts/1.json
  def show
  end

  # GET /posts/new
  def new
    @post = current_account.posts.build
  end

  # GET /posts/1/edit
  def edit
  end

  # POST /posts
  # POST /posts.json
  def create
     @post = current_account.posts.build(post_params)

    respond_to do |format|
      if @post.save
        format.html { redirect_to @post, notice: 'Post was successfully created.' }
        format.json { render :show, status: :created, location: @post }
      else
        format.html { render :new }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /posts/1
  # PATCH/PUT /posts/1.json
  def update
    respond_to do |format|
      if @post.update(post_params)
        format.html { redirect_to @post, notice: 'Post was successfully updated.' }
        format.json { render :show, status: :ok, location: @post }
      else
        format.html { render :edit }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /posts/1
  # DELETE /posts/1.json
  def destroy
    @post.destroy
    respond_to do |format|
      format.html { redirect_to posts_url, notice: 'Post was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def geolocation
    @users = Account.all_except(current_account.id).near(current_account.address, 100)
    @hash = Gmaps4rails.build_markers(@users) do |user, marker|
        marker.lat user.latitude
        marker.lng user.longitude

    marker.picture({
              :width  => "45",
              :height => "45"
             })

     marker.infowindow render_to_string(:partial => "/posts/info",
        :locals => {:name => user.first_name, :lastname => user.last_name, :birthday=> user.birthday, :id=> user.id, :username=> user.username, :address=> user.address })


    end
  end


  private
    # Use callbacks to share common setup or constraints between actions.
    def set_post
      @post = Post.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def post_params
      params.require(:post).permit(:post, :postimage)
    end

    def owned_post
        unless current_account == @post.account || current_account.has_role?(:admin)
            flash[:alert] = "Non puoi modificare un post non creato da te!"
            redirect_to posts_path
    end

end
end

