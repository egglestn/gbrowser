class Finish < ApplicationRecord
  mount_uploader :picture, PictureUploader

  belongs_to :room
  belongs_to :developer, optional: false
  belongs_to :division, optional: true
  belongs_to :development, optional: false

  has_many :documents, as: :documentable
  accepts_nested_attributes_for :documents, reject_if: :all_blank, allow_destroy: true

  validates :name, presence: true

  before_validation :add_development, if: -> { development.blank? }
  before_validation :add_developer, if: -> { developer.blank? }
  before_validation :add_division, if: -> { division.blank? }

  def add_development
    if room.respond_to?(:development)
      self.development = room.development
    end
  end

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
