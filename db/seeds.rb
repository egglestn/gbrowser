# frozen_string_literal: true
# This file should contain all the record creation needed to seed the database with its
# default values.
# The data can then be loaded with the rails db:seed command (or created alongside the
# database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
if User.none?
  User.create!(
    first_name: "admin",
    last_name: "admin",
    role: :cf_admin,
    email: "admin@alliants.com",
    password: "12345678"
  )

  STDOUT.puts <<~INFO

  #{'*' * 100}
    Default Admin user has been added:
    email: admin@alliants.com
    password: 12345678
    #{'*' * 100}

  INFO
end
