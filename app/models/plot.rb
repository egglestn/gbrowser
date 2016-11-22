# frozen_string_literal: true
class Plot < ApplicationRecord
  ownable_by :developer, :division, from: :development

  belongs_to :unit_type
  belongs_to :developer, optional: false
  belongs_to :division, optional: true
  belongs_to :development, optional: false

  has_many :plot_residents
  has_many :residents, through: :plot_residents

  has_many :rooms, through: :unit_type
  has_many :finishes, through: :rooms
  has_many :documents, as: :documentable
  accepts_nested_attributes_for :documents, reject_if: :all_blank, allow_destroy: true

  validates :number, :unit_type, presence: true

  def to_s
    if prefix.blank?
      number
    else
      "#{prefix}  #{number}"
    end
  end
end
