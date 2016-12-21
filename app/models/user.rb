# frozen_string_literal: true
class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable,
         :recoverable,
         :rememberable,
         :trackable,
         :validatable

  enum role: [
    :admin,
    :guest
  ]

  validates :role, :first_name, :last_name, presence: true

  def to_s
    "#{first_name} #{last_name}"
  end
end
