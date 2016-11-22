class UnitType < ApplicationRecord
  ownable_by :developer, :division, from: :development

  belongs_to :developer, optional: false
  belongs_to :division, optional: true
  belongs_to :development, optional: true

  has_many :rooms, dependent: :destroy
  has_many :plots, dependent: :destroy
  has_many :phases_unit_types, dependent: :destroy
  has_many :phases, through: :phases_unit_types
  has_many :documents, as: :documentable
  accepts_nested_attributes_for :documents, reject_if: :all_blank, allow_destroy: true
  has_many :images, as: :imageable
  accepts_nested_attributes_for :images, reject_if: :all_blank, allow_destroy: true

  validates :name, presence: true
  validates :phases, presence: true
  validate :phases_are_under_development

  def phases_are_under_development
    unless phases.map(&:development_id).uniq == [development.id]
      errors.add(:phases, 'must be from the development the unit type is for')
    end
  end

  def to_s
    name
  end
end
