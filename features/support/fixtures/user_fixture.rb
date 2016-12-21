module UserFixture
  module_function

  def create
    FactoryGirl.create(
      :user,
      email: email,
      password: password,
      first_name: first_name
    )
  end

  def email
    "user@example.com"
  end

  def password
    "87654321"
  end

  def first_name
    "Jonathan"
  end
end
