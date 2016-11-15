class Image < ApplicationRecord
  mount_uploader :file, PictureUploader

  belongs_to :imageable, polymorphic: true
  belongs_to :developer
  belongs_to :division, optional: true
  belongs_to :development, optional: true

  validates :file, presence: true

  before_save :add_developer, if: -> { developer.blank? }
  before_save :add_division, if: -> { division.blank? }
  before_save :add_development, if: -> { development.blank? }

  def add_developer
    if imageable.respond_to?(:developer)
      self.developer = imageable.developer
    end
  end

  def add_division
    if imageable.respond_to?(:division)
      self.division = imageable.division
    end
  end

  def add_development
    if imageable.respond_to?(:development)
      self.development = imageable.development
    end
  end
end
