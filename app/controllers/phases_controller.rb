# frozen_string_literal: true
class PhasesController < ApplicationController
  load_and_authorize_resource :development
  load_and_authorize_resource :phase, through: :development

  # GET /phases
  def index
  end

  # GET /phases/1
  def show
  end

  # GET /phases/new
  def new
  end

  # GET /phases/1/edit
  def edit
  end

  # POST /phases
  def create
    respond_to do |format|
      if @phase.save
        # rubocop:disable LineLength
        format.html { redirect_to [@development, @phase], notice: "Phase was successfully created." }
        # rubocop:enable LineLength
      else
        format.html { render :new }
      end
    end
  end

  # PATCH/PUT /phases/1
  def update
    respond_to do |format|
      if @phase.update(phase_params)
        # rubocop:disable LineLength
        format.html { redirect_to [@development, @phase], notice: "Phase was successfully updated." }
        # rubocop:enable LineLength
      else
        format.html { render :edit }
      end
    end
  end

  # DELETE /phases/1
  def destroy
    @phase.destroy
    respond_to do |format|
      # rubocop:disable LineLength
      format.html { redirect_to development_phases_url(@development), notice: "Phase was successfully destroyed." }
      # rubocop:enable LineLength
    end
  end

  private

  # Never trust parameters from the scary internet, only allow the white list through.
  def phase_params
    params.require(:phase).permit(:name, :development_id)
  end
end
