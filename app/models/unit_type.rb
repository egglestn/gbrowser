class UnitType < ApplicationRecord

  has_many :rooms, dependent: :destroy
  has_many :plots, dependent: :destroy
  has_many :phases_unit_types, dependent: :destroy
  has_many :phases, through: :phases_unit_types
  has_one :development, through: :phases
  has_many :documents, as: :documentable
  accepts_nested_attributes_for :documents, reject_if: :all_blank, allow_destroy: true
  has_many :images, as: :imageable
  accepts_nested_attributes_for :images, reject_if: :all_blank, allow_destroy: true

  validates :name, presence: true
  validates :phases, presence: true

  def to_s
    name
  end
end
