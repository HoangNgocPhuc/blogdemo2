class StaticPagesController < ApplicationController
  def index
    @posts = Post.select_all_posts.page(params[:page]).per Settings.post.per_page
    @hot_users = User.hot_user
    @post = current_user.posts.build if user_signed_in?
    @tag = Tag.new
  end
end
