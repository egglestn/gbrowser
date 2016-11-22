class Phase < ApplicationRecord
  ownable_by :developer, :division, from: :development

  belongs_to :development, optional: false
  belongs_to :developer, optional: false
  belongs_to :division, optional: true

  has_many :phases_unit_types
  has_many :unit_types, through: :phases_unit_types

  validates :name, presence: true

  def to_s
    name
  end
end
