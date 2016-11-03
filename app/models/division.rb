class Division < ApplicationRecord
  belongs_to :developer

  has_many :developments, through: :developer

  validates :division_name, presence: true

  def to_s
    division_name
  end
end
