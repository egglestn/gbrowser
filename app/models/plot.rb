class Plot < ApplicationRecord
  belongs_to :unit_type

  has_one :development, through: :unit_type

  validates :number, presence: true

  def to_s
    if prefix.blank?
      number
    else
      "#{prefix}  #{number}"
    end
  end
end
