# frozen_string_literal: true
module Features
  module_function

  def s3_storage?
    hosted_env
  end

  def bullet_footer?
    Rails.env.development? || Rails.env.qa?
  end

  def rollbar?
    hosted_env
  end

  private

  module_function

  def hosted_env
    Rails.env.production? || Rails.env.staging? || Rails.env.qa?
  end
end
