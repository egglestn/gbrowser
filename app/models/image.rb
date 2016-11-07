class Image < ApplicationRecord
  mount_uploader :file, PictureUploader

  belongs_to :imageable, polymorphic: true

  validates :file, presence: true
end
