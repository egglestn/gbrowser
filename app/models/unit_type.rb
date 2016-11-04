class UnitType < ApplicationRecord

  has_one :development, through: :phase
  has_many :rooms
  has_many :plots
  has_many :phases_unit_types
  has_many :phases, through: :phases_unit_types

  validates :name, presence: true

  def to_s
    name
  end
end
