module AdminUserFixture
  module_function

  def create
    FactoryGirl.create(:admin, email: email, password: password)
  end

  def email
    "admin@alliants.com"
  end

  def password
    "12345678"
  end
end
