# frozen_string_literal: true
class UnitTypesController < ApplicationController
  load_and_authorize_resource :development
  load_and_authorize_resource :unit_type, through: :development

  def index
  end

  def new
  end

  def edit
  end

  def show
  end

  def create
    if @unit_type.save
      notice = t(
        "controller.success.create",
        name: @unit_type.name
      )
      redirect_to [@development, @unit_type], notice: notice
    else
      render :new
    end
  end

  def update
    if @unit_type.update(unit_type_params)
      notice = t(
        "controller.success.update",
        name: @unit_type.name
      )
      redirect_to [@development, @unit_type], notice: notice
    else
      render :edit
    end
  end

  def destroy
    @unit_type.destroy
    redirect_to unit_types_url, notice: t("controller.success.destroy", name: @unit_type.name)
  end

  private

  # Never trust parameters from the scary internet, only allow the white list through.
  def unit_type_params
    params.require(:unit_type).permit(
      :name, phase_ids: [],
             documents_attributes: [:id, :title, :file, :_destroy],
             images_attributes: [:id, :title, :file, :_destroy]
    )
  end
end
