class Plot < ApplicationRecord
  belongs_to :unit_type

  has_one :development, through: :unit_type
  has_many :documents, as: :documentable
  accepts_nested_attributes_for :documents, reject_if: :all_blank, allow_destroy: true

  validates :number, presence: true

  def to_s
    if prefix.blank?
      number
    else
      "#{prefix}  #{number}"
    end
  end
end
