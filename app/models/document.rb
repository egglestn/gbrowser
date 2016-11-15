class Document < ApplicationRecord
  mount_uploader :file, DocumentUploader

  belongs_to :documentable, polymorphic: true

  belongs_to :developer, optional: false
  belongs_to :division, optional: true
  belongs_to :development, optional: true

  before_save :add_developer, if: -> { developer.blank? }
  before_save :add_division, if: -> { division.blank? }
  before_save :add_development, if: -> { development.blank? }

  def add_developer
    if documentable.respond_to?(:developer)
      self.developer = documentable.developer
    end
  end

  def add_division
    if documentable.respond_to?(:division)
      self.division = documentable.division
    end
  end

  def add_development
    if documentable.respond_to?(:development)
      self.development = documentable.development
    end
  end

  def to_s
    file&.file&.filename || "Untitled"
  end
end
