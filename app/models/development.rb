class Development < ApplicationRecord
  belongs_to :developer

  has_many :phases

  validates :development_name, presence: true

  delegate :to_s, to: :development_name
end
