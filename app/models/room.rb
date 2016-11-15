class Room < ApplicationRecord
  belongs_to :unit_type
  belongs_to :developer, optional: false
  belongs_to :division, optional: true
  belongs_to :development, optional: false

  has_many :finishes, dependent: :destroy
  has_many :documents, as: :documentable, dependent: :destroy
  accepts_nested_attributes_for :documents, reject_if: :all_blank, allow_destroy: true

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
