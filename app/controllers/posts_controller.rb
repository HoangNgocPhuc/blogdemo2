class PostsController < ApplicationController
  before_action :authenticate_user!, except: :show
  before_action :correct_user, only: [:edit, :update, :destroy]

  def create
    @post = current_user.posts.build post_params
    respond
  end

  def show
  end

  def edit
  end

  def update
    @post.update_attributes post_params
    respond
  end

  def destroy
    if @post.destroy
      respond
    else
      redirect_to root_url
    end
  end

  private

  def post_params
    params.require(:post).permit :title, :content, :all_tags
  end

  def correct_user
    @post = current_user.posts.find_by id: params[:id]
    redirect_to root_url unless @post
  end

  def respond
    respond_to do |format|
      format.html{redirect_to :back}
      format.js
    end
  end
end
