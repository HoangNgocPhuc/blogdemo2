class CommentsController < ApplicationController
  before_action :correct_user, only: [:edit, :update, :destroy]
  load_and_authorize_resource

  def create
    @post = Post.find_by id: params[:post_id]
    redirect_to root_url unless @post
    @comment = @post.comments.build comment_params
    @comment.user_id = current_user.id
    if @comment.save
      respond
    else
      flash[:danger] = t ".danger"
      redirect_to root_url
    end
  end

  def edit
    respond
  end

  def update
    if @comment.update_attributes comment_params
      respond
    else
      flash[:warning] = t ".update_lost"
      redirect_to root_url
    end
  end

  def destroy
    if @comment.destroy
      respond
    else
      flash[:warning] = t "delete_lost"
      redirect_to root_url
    end
  end

  private

  def correct_user
    @comment = current_user.comments.find_by id: params[:id]
    redirect_to root_url if @comment.user != current_user
  end

  def comment_params
    params.require(:comment).permit :content
  end

  def respond
    respond_to do |format|
      format.html{redirect_to :back}
      format.js
    end
  end
end
