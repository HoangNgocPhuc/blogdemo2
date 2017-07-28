class RelationshipsController < ApplicationController
  before_action :authenticate_user!

  def create
    @user = User.find_by id: params[:followed_id]
    render file: "public/404.html" unless current_user.follow @user
    respond
  end

  def destroy
    @user = Relationship.find_by(id: params[:id]).followed
    render file: "public/404.html" unless current_user.unfollow @user
    respond
  end

  private

  def respond
    respond_to do |format|
      format.html{redirect_to :back}
      format.js
    end
  end
end
