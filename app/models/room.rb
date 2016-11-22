class Room < ApplicationRecord
  ownable_by :developer, :division, :development, from: :unit_type

  belongs_to :unit_type
  belongs_to :developer, optional: false
  belongs_to :division, optional: true
  belongs_to :development, optional: false

  has_many :finishes, dependent: :destroy
  has_many :documents, as: :documentable, dependent: :destroy
  accepts_nested_attributes_for :documents, reject_if: :all_blank, allow_destroy: true

  validates :name, presence: true

  def to_s
    name
  end
end
