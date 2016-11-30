# frozen_string_literal: true
class UnitTypesController < ApplicationController
  load_and_authorize_resource :development
  load_and_authorize_resource :unit_type, through: :development

  # GET /unit_types
  def index
  end

  # GET /unit_types/1
  def show
  end

  # GET /unit_types/new
  def new
  end

  # GET /unit_types/1/edit
  def edit
  end

  # POST /unit_types
  def create
    respond_to do |format|
      if @unit_type.save
        # rubocop:disable LineLength
        format.html { redirect_to [@development, @unit_type], notice: "Unit type was successfully created." }
        # rubocop:enable LineLength
      else
        format.html { render :new }
      end
    end
  end

  # PATCH/PUT /unit_types/1
  def update
    respond_to do |format|
      if @unit_type.update(unit_type_params)
        # rubocop:disable LineLength
        format.html { redirect_to [@development, @unit_type], notice: "Unit type was successfully updated." }
        # rubocop:enable LineLength
      else
        format.html { render :edit }
      end
    end
  end

  # DELETE /unit_types/1
  def destroy
    @unit_type.destroy
    respond_to do |format|
      format.html { redirect_to unit_types_url, notice: "Unit type was successfully destroyed." }
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
