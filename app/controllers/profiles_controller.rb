class ProfilesController < ApplicationController
    before_action :authenticate_account!

    def show
        @user = Account.find(params[:id])
        @user_posts = @user.posts
        @comments = Reply.where("account_id = ?", params[:id])
        @comments_count = @comments.count
        @nearby_users = Account.all_except(@user.id).near(@user.address, 100)
    end

end
