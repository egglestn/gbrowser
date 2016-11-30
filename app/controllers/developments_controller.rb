# frozen_string_literal: true
class DevelopmentsController < ApplicationController
  load_and_authorize_resource

  # GET /developments
  def index
  end

  # GET /developments/1
  def show
  end

  # GET /developments/new
  def new
  end

  # GET /developments/1/edit
  def edit
  end

  # POST /developments
  def create
    respond_to do |format|
      if @development.save
        format.html { redirect_to @development, notice: "Development was successfully created." }
      else
        format.html { render :new }
      end
    end
  end

  # PATCH/PUT /developments/1
  def update
    respond_to do |format|
      if @development.update(development_params)
        format.html { redirect_to @development, notice: "Development was successfully updated." }
      else
        format.html { render :edit }
      end
    end
  end

  # DELETE /developments/1
  def destroy
    @development.destroy
    respond_to do |format|
      # rubocop:disable LineLength
      format.html { redirect_to developments_url, notice: "Development was successfully destroyed." }
      # rubocop:enable LineLength
    end
  end

  private

  # Never trust parameters from the scary internet, only allow the white list through.
  def development_params
    params.require(:development).permit(
      :development_name,
      :developer_id,
      :division_id,
      :office_address,
      :city,
      :county,
      :postcode,
      :email,
      :contact_number
    )
  end
end
