class Development < ApplicationRecord
  belongs_to :developer, optional: false
  belongs_to :division, optional: true

  has_many :documents, dependent: :destroy
  has_many :finishes, dependent: :destroy
  has_many :images, dependent: :destroy
  has_many :plots, dependent: :destroy
  has_many :phases, dependent: :destroy
  has_many :rooms, dependent: :destroy
  has_many :unit_types, dependent: :destroy

  validates :development_name, presence: true
  validate :division_is_under_developer,
           if: -> { division.present? && developer.present? }

  delegate :to_s, to: :development_name

  def division_is_under_developer
    unless division.developer_id == developer.id
      errors.add(:division, 'must be under the chosen Developer')
    end
  end
end
