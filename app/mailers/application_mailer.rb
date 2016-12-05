# frozen_string_literal: true
class ApplicationMailer < ActionMailer::Base
  default from: "info@hoozzi.com"
  layout "mailer"
end
