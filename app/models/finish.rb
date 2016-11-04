class Finish < ApplicationRecord
  mount_uploader :picture, PictureUploader

  belongs_to :room

  has_many :developments, through: :room
  has_many :documents, as: :documentable
  accepts_nested_attributes_for :documents, reject_if: :all_blank, allow_destroy: true

  validates :name, presence: true

  def to_s
    name
  end
end
