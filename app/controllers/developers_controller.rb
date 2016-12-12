# frozen_string_literal: true
class DevelopersController < ApplicationController
  load_and_authorize_resource

  def index
    @developers = @developers.page(params[:page]).per(params[:per])
  end

  def new
  end

  def edit
  end

  def show
  end

  def create
    if @developer.save
      redirect_to @developer, notice: t("controller.success.create", name: @developer.company_name)
    else
      render :new
    end
  end

  def update
    if @developer.update(developer_params)
      redirect_to @developer, notice: t("controller.success.update", name: @developer.company_name)
    else
      render :edit
    end
  end

  def destroy
    @developer.destroy
    notice = t(
      "controller.success.destroy",
      name: @developer.company_name
    )
    redirect_to developers_url, notice: notice
  end

  private

  # Never trust parameters from the scary internet, only allow the white list through.
  def developer_params
    params.require(:developer).permit(
      :company_name,
      :head_office_address,
      :city,
      :county,
      :postcode,
      :email,
      :contact_number
    )
  end
end
