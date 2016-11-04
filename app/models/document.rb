class Document < ApplicationRecord
  mount_uploader :file, DocumentUploader

  belongs_to :documentable, polymorphic: true
end
