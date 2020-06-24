class Post < ApplicationRecord
  validates :tag_id, :title, :text, :image, presence: true, uniqueness: true

  belongs_to :user
  has_many   :comments, dependent: :destroy
  has_many   :tags, through: :post_tags
  has_many   :post_tags, dependent: :destroy

  mount_uploader :image, ImageUploader
end
