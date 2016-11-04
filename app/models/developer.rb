class Developer < ApplicationRecord
  has_many :developments, dependent: :destroy
  has_many :divisions, dependent: :destroy

  validates :company_name, presence: true

  delegate :to_s, to: :company_name
end
