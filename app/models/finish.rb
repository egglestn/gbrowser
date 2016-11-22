class Finish < ApplicationRecord
  ownable_by :developer, :division, :development, from: :room
  mount_uploader :picture, PictureUploader

  belongs_to :room
  belongs_to :developer, optional: false
  belongs_to :division, optional: true
  belongs_to :development, optional: false

  has_many :documents, as: :documentable
  accepts_nested_attributes_for :documents, reject_if: :all_blank, allow_destroy: true

  validates :name, presence: true

  def to_s
    name
  end
end
