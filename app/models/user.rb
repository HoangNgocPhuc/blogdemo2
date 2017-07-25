class User < ApplicationRecord
  has_many :active_relationships, class_name: Relationship.name,
    foreign_key: :follower_id, dependent: :destroy
  has_many :passive_relationships, class_name: Relationship.name,
    foreign_key: :followed_id, dependent: :destroy
  has_many :following, through: :active_relationships, source: :followed
  has_many :followers, through: :passive_relationships, source: :follower
  has_many :posts, dependent: :destroy
  has_many :comments, dependent: :destroy

  devise :database_authenticatable, :registerable, :recoverable, :rememberable,
    :validatable

  scope :hot_user, lambda{
    joins(:followers).group("users.id")
      .order("count(users.id) DESC").limit(Settings.hot_user.number)
  }

  validates :name, presence: true, length: {maximum: Settings.user.name.maximum}
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i
  validates :email, presence: true,
    length: {maximum: Settings.user.email.maximum},
    format: {with: VALID_EMAIL_REGEX}, uniqueness: {case_sensitive: false}
  validates :password, presence: true,
    length: {minimum: Settings.user.password.minimum}, allow_nil: true

  def follow other_user
    following << other_user
  end

  def unfollow other_user
    following.delete other_user
  end
end
