class User < ApplicationRecord
  belongs_to :developer, optional: true
  belongs_to :division, optional: true

  # as home owner, maybe move these out?
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
         :cf_admin,      # Client Folio Admin
         :client_admin,  # Hoozzi Admin to setup Clients (Developers)
         :client_user,   # Hoozzi Sales (on-site to setup owners)
         :owner,         # Customers who purchased a plot
       ]

  validates :role, :first_name, :last_name, presence: true
  validate :client_user_assignment, if: :client_user?
  validate :non_client_user_assignment, unless: :client_user?

  def client_user_assignment
    if developer.blank? && division.blank?
      errors.add(:role, 'must have a Developer or Division for a Client User.')
    end
  end

  def non_client_user_assignment
    if !developer.blank? || !division.blank?
      errors.add(:role, 'other than Client User must not have a Developer or Division. Please leave those fields blank.')
    end
  end

  def to_s
    "#{first_name} #{last_name}"
  end
end
