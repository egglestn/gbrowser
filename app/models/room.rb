class Room < ApplicationRecord
  belongs_to :unit_type

  has_one :development, through: :unit_type

  has_many :finishes, dependent: :destroy

  validates :name, presence: true

  def to_s
    name
  end
end
