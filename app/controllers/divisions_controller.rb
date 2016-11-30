# frozen_string_literal: true
class DivisionsController < ApplicationController
  load_and_authorize_resource :developer
  load_and_authorize_resource :division, through: :developer

  def index
  end

  def new
  end

  def edit
  end

  def show
  end

  def create
    if @division.save
      redirect_to [@developer, @division], notice: "Division was successfully created."
    else
      render :new
    end
  end

  def update
    if @division.update(division_params)
      redirect_to [@developer, @division], notice: "Division was successfully updated."
    else
      render :edit
    end
  end

  def destroy
    @division.destroy
    redirect_to developer_divisions_url, notice: "Division was successfully destroyed."
  end

  private

  # Never trust parameters from the scary internet, only allow the white list through.
  def division_params
    params.require(:division).permit(
      :division_name,
      :address,
      :city,
      :county,
      :postcode,
      :email,
      :contact_number
    )
  end
end
