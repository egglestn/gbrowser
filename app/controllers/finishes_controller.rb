# frozen_string_literal: true
class FinishesController < ApplicationController
  load_and_authorize_resource :room
  load_and_authorize_resource :finish, through: :room
  before_action :set_development

  def index
  end

  def new
  end

  def edit
  end

  def show
  end

  def create
    if @finish.save
      redirect_to [@room, @finish], notice: "Finish was successfully created."
    else
      render :new
    end
  end

  def update
    if @finish.update(finish_params)
      redirect_to [@room, @finish], notice: "Finish was successfully updated."
    else
      render :edit
    end
  end

  def destroy
    @finish.destroy
    redirect_to room_finishes_url(@room), notice: "Finish was successfully destroyed."
  end

  private

  def set_development
    @development = @room.development
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def finish_params
    params.require(:finish).permit(
      :room_id,
      :name,
      :category,
      :picture,
      documents_attributes: [:id, :title, :file, :_destroy]
    )
  end
end
