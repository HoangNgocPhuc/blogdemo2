class StaticPagesController < ApplicationController
  def index
    @post = Post.select_all_posts.page(params[:page]).per Settings.post.per_page
    @hot_users = User.hot_user
  end
end
