class Phase < ApplicationRecord
  belongs_to :development

  validates :name, presence: true
end
