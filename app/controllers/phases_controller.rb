# frozen_string_literal: true
class PhasesController < ApplicationController
  load_and_authorize_resource :development
  load_and_authorize_resource :phase, through: :development

  # GET /phases
  # GET /phases.json
  def index
  end

  # GET /phases/1
  # GET /phases/1.json
  def show
  end

  # GET /phases/new
  def new
  end

  # GET /phases/1/edit
  def edit
  end

  # POST /phases
  # POST /phases.json
  def create
    respond_to do |format|
      if @phase.save
        format.html { redirect_to [@development, @phase], notice: "Phase was successfully created." }
        format.json { render :show, status: :created, location: @phase }
      else
        format.html { render :new }
        format.json { render json: @phase.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /phases/1
  # PATCH/PUT /phases/1.json
  def update
    respond_to do |format|
      if @phase.update(phase_params)
        format.html { redirect_to [@development, @phase], notice: "Phase was successfully updated." }
        format.json { render :show, status: :ok, location: @phase }
      else
        format.html { render :edit }
        format.json { render json: @phase.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /phases/1
  # DELETE /phases/1.json
  def destroy
    @phase.destroy
    respond_to do |format|
      format.html { redirect_to development_phases_url(@development), notice: "Phase was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private

  # Never trust parameters from the scary internet, only allow the white list through.
  def phase_params
    params.require(:phase).permit(:name, :development_id)
  end
end
