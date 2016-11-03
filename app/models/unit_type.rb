class UnitType < ApplicationRecord
  belongs_to :phase

  has_one :development, through: :phase

  validates :name, presence: true

  def to_s
    name
  end
end
