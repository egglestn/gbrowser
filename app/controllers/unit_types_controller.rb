# frozen_string_literal: true
class UnitTypesController < ApplicationController
  load_and_authorize_resource :development
  load_and_authorize_resource :unit_type, through: :development

  # GET /unit_types
  # GET /unit_types.json
  def index
  end

  # GET /unit_types/1
  # GET /unit_types/1.json
  def show
  end

  # GET /unit_types/new
  def new
  end

  # GET /unit_types/1/edit
  def edit
  end

  # POST /unit_types
  # POST /unit_types.json
  def create
    respond_to do |format|
      if @unit_type.save
        format.html { redirect_to [@development, @unit_type], notice: "Unit type was successfully created." }
        format.json { render :show, status: :created, location: @unit_type }
      else
        format.html { render :new }
        format.json { render json: @unit_type.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /unit_types/1
  # PATCH/PUT /unit_types/1.json
  def update
    respond_to do |format|
      if @unit_type.update(unit_type_params)
        format.html { redirect_to [@development, @unit_type], notice: "Unit type was successfully updated." }
        format.json { render :show, status: :ok, location: @unit_type }
      else
        format.html { render :edit }
        format.json { render json: @unit_type.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /unit_types/1
  # DELETE /unit_types/1.json
  def destroy
    @unit_type.destroy
    respond_to do |format|
      format.html { redirect_to unit_types_url, notice: "Unit type was successfully destroyed." }
      format.json { head :no_content }
    end
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
