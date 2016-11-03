class Developer < ApplicationRecord
  has_many :developments
  has_many :divisions

  validates :company_name, presence: true

  delegate :to_s, to: :company_name
end
