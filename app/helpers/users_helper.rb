module UsersHelper
  def active_relationship
    current_user.active_relationships.build
  end

  def passtive_relationship other_user
    current_user.active_relationships
      .find_by followed_id: other_user
  end
end
