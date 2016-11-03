class Development < ApplicationRecord
  belongs_to :developer

  validates :development_name, presence: true

  delegate :to_s, to: :development_name
end
