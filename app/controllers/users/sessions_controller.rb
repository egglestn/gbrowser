# frozen_string_literal: true
class Users::SessionsController < Devise::SessionsController
  layout -> { admin_route? ? "admin_login" : "login" }
  skip_authorization_check
  skip_before_action :redirect_users

  # before_action :configure_sign_in_params, only: [:create]

  # GET /resource/sign_in
  def new
    self.resource = resource_class.new(sign_in_params)
    clean_up_passwords(resource)
    yield resource if block_given?

    if admin_route?
      render "devise/admin/sessions/new"
    else
      @content = UserLoginContentService.call
      respond_with(resource, serialize_options(resource))
    end
  end

  # POST /resource/sign_in
  # def create
  #   super
  # end

  # DELETE /resource/sign_out
  # def destroy
  #   super
  # end

  # protected

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_sign_in_params
  #   devise_parameter_sanitizer.permit(:sign_in, keys: [:attribute])
  # end

  private

  def admin_route?
    request.path == "/admin"
  end
end
