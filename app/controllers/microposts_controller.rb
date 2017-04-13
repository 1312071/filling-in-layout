class MicropostsController < ApplicationController
  before_action :logged_in_user, only: [:create, :destroy]
  before_action :load_micropost, only: :destroy

  def create
    @micropost = current_user.microposts.build micropost_params
    if @micropost.save
      flash[:success] = t ".micropost_created"
      redirect_to root_url
    else
      @feed_items = []
      render "static_pages/home"
    end
  end

  def destroy
    if @micropost.destroy
      flash[:success] = t ".micropost_deleted"
    else
      flash[:danger] = t ".delete_failed"
    end
    redirect_to request.referrer || root_url
  end

  private

  def micropost_params
    params.require(:micropost).permit :content, :picture
  end

  def load_micropost
    @micropost = current_user.microposts.find_by id: params[:id]
    if @micropost.nil?
      redirect_to root_url
      flash[:danger] = t ".micropost_nil"
    end
  end
end
