class User < ApplicationRecord
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
