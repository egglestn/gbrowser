class Document < ApplicationRecord
  mount_uploader :file, DocumentUploader

  belongs_to :documentable, polymorphic: true

  def to_s
    file&.file&.filename || "Untitled"
  end
end
