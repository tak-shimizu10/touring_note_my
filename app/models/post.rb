class Post < ApplicationRecord
  validates :tag_id, :title, :text, :image, presence: true, uniqueness: true

  belongs_to :user
  belongs_to :tag
  has_many   :comments, dependent: :destroy

  mount_uploader :image, ImageUploader
end
