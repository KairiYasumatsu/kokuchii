class Post < ApplicationRecord
  belongs_to :user
  mount_uploader :image, ImageUploader
  has_many :likes
  has_many :liked_users, through: :likes, source: :user
  has_many :comments
end
