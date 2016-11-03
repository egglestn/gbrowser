class UnitType < ApplicationRecord
  belongs_to :phase

  has_one :development, through: :phase
  has_many :rooms

  validates :name, presence: true

  def to_s
    name
  end
end
