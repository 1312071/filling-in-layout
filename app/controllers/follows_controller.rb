class FollowsController < ApplicationController
  before_action :load_user, :logged_in_user, only: [:following, :followers]

  def following
    @title = t ".following"
    @users = @user.following.paginate page: params[:page],
      per_page: Settings.per_page
    render "users/show_follow", object: @user
  end

  def followers
    @title = t ".follower"
    @users = @user.followers.paginate page: params[:page],
      per_page: Settings.per_page
    render "users/show_follow", object: @user
  end
end
