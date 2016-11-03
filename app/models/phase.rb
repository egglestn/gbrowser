class Phase < ApplicationRecord
  belongs_to :development

  has_many :unit_types

  validates :name, presence: true

  def to_s
    name
  end
end
