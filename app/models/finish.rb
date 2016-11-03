class Finish < ApplicationRecord
  mount_uploader :picture, PictureUploader

  belongs_to :room

  has_many :developments, through: :room

  validates :name, presence: true

  def to_s
    name
  end
end
