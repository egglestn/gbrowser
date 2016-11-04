class UnitType < ApplicationRecord

  has_many :rooms, dependent: :destroy
  has_many :plots, dependent: :destroy
  has_many :phases_unit_types, dependent: :destroy
  has_many :phases, through: :phases_unit_types
  has_one :development, through: :phases

  validates :name, presence: true
  validates :phases, presence: true

  def to_s
    name
  end
end
