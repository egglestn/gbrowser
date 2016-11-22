class Image < ApplicationRecord
  ownable_by :developer, :division, :development, from: :imageable
  mount_uploader :file, PictureUploader

  belongs_to :imageable, polymorphic: true
  belongs_to :developer
  belongs_to :division, optional: true
  belongs_to :development, optional: true

  validates :file, presence: true
end
