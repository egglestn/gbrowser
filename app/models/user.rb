class User < ApplicationRecord
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

  def to_s
    "#{first_name} #{last_name}"
  end
end
