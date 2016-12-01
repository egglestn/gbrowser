# frozen_string_literal: true
class PhasesController < ApplicationController
  load_and_authorize_resource :development
  load_and_authorize_resource :phase, through: :development

  def index
  end

  def new
  end

  def edit
  end

  def show
  end

  def create
    if @phase.save
      redirect_to [@development, @phase], notice: "Phase was successfully created."
    else
      render :new
    end
  end

  def update
    if @phase.update(phase_params)
      redirect_to [@development, @phase], notice: "Phase was successfully updated."
    else
      render :edit
    end
  end

  def destroy
    @phase.destroy
    redirect_to development_phases_url(@development), notice: "Phase was successfully destroyed."
  end

  private

  # Never trust parameters from the scary internet, only allow the white list through.
  def phase_params
    params.require(:phase).permit(:name, :development_id)
  end
end
