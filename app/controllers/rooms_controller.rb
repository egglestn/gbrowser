# frozen_string_literal: true
class RoomsController < ApplicationController
  load_and_authorize_resource :development
  load_and_authorize_resource :room, through: :development

  def index
  end

  def new
  end

  def edit
  end

  def show
  end

  def create
    if @room.save
      redirect_to [@development, @room], notice: t("controller.success.create", name: @room.name)
    else
      render :new
    end
  end

  def update
    if @room.update(room_params)
      redirect_to [@development, @room], notice: t("controller.success.update", name: @room.name)
    else
      render :edit
    end
  end

  def destroy
    @room.destroy
    notice = t(
      "controller.success.destroy",
      name: @room.name
    )
    redirect_to development_rooms_url(@development), notice: notice
  end

  private

  # Never trust parameters from the scary internet, only allow the white list through.
  def room_params
    params.require(:room).permit(
      :name,
      :unit_type_id,
      documents_attributes: [:id, :title, :file, :_destroy]
    )
  end
end
