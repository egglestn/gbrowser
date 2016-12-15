# frozen_string_literal: true
class User < ApplicationRecord
  belongs_to :developer, optional: true
  belongs_to :division, optional: true

  has_many :plot_residents
  has_many :plots, through: :plot_residents

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable,
         :recoverable,
         :rememberable,
         :trackable,
         :validatable

  enum role: [
    :admin,
    :user
  ]

  validates :role, :first_name, :last_name, presence: true

  def to_s
    "#{first_name} #{last_name}"
  end
end
