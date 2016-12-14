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
if User.admin.none?
  admin_email = "admin@alliants.com"
  admin_password = "12345678"

  User.create!(
    first_name: "admin",
    last_name: "admin",
    role: :admin,
    email: admin_email,
    password: admin_password
  )

  STDOUT.puts <<-INFO

  #{'*' * 100}
  Default Admin user has been added:
    email: admin@alliants.com
    password: 12345678
  #{'*' * 100}

  INFO
end

if Rails.env.development? && User.user.none?
  user_email = "user@alliants.com"
  user_password = "12345678"


  User.create!(
    first_name: "user",
    last_name: "user",
    role: :user,
    email: user_email,
    password: user_password
  )

  STDOUT.puts <<-INFO

  #{'*' * 100}
  User has been added:
    email: #{user_email}
    password: #{user_password}
  #{'*' * 100}

  INFO
end

if UserLoginContent.none?
  content = UserLoginContent.new
  content.title_left = I18n.t('devise.sessions.new.title.left')
  content.title_right = I18n.t('devise.sessions.new.title.right')
  content.blurb_para_1 = I18n.t('devise.sessions.new.intro_para_1')
  content.blurb_para_2 = I18n.t('devise.sessions.new.intro_para_2')
  content.save!
end
