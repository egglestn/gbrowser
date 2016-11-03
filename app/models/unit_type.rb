class UnitType < ApplicationRecord
  belongs_to :phase

  has_one :development, through: :phase
  has_many :rooms
  has_many :plots

  validates :name, presence: true

  def to_s
    name
  end
end
