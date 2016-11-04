class Development < ApplicationRecord
  belongs_to :developer

  has_many :phases, dependent: :destroy
  has_many :unit_types, through: :phases
  has_many :rooms, through: :unit_types
  has_many :plots, through: :unit_types

  validates :development_name, presence: true

  delegate :to_s, to: :development_name
end
