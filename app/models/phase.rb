class Phase < ApplicationRecord
  belongs_to :development, optional: false
  belongs_to :developer, optional: false
  belongs_to :division, optional: true

  has_many :phases_unit_types
  has_many :unit_types, through: :phases_unit_types

  validates :name, presence: true

  before_validation :add_developer, if: -> { developer.blank? }
  before_validation :add_division, if: -> { division.blank? }

  def add_developer
    if development.respond_to?(:developer)
      self.developer = development.developer
    end
  end

  def add_division
    if development.respond_to?(:division)
      self.division = development.division
    end
  end

  def to_s
    name
  end
end
