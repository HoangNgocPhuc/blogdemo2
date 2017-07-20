class Tag < ApplicationRecord
  has_many :post_tags, dependent: :destroy, class_name: PostTag.name
  has_many :posts, through: :post_tags
end
