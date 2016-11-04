class UnitType < ApplicationRecord

  has_many :rooms
  has_many :plots
  has_many :phases_unit_types
  has_many :phases, through: :phases_unit_types
  has_one :development, through: :phases

  validates :name, presence: true
  validates :phases, presence: true

  def to_s
    name
  end
end
