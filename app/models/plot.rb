class Plot < ApplicationRecord
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
    if prefix.blank?
      number
    else
      "#{prefix}  #{number}"
    end
  end
end
