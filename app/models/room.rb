class Room < ApplicationRecord
  belongs_to :unit_type

  has_one :development, through: :unit_type

  has_many :finishes, dependent: :destroy
  has_many :documents, as: :documentable, dependent: :destroy
  accepts_nested_attributes_for :documents, reject_if: :all_blank, allow_destroy: true

  validates :name, presence: true

  def to_s
    name
  end
end
