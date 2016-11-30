# frozen_string_literal: true
class DevelopersController < ApplicationController
  load_and_authorize_resource

  # GET /developers
  def index
  end

  # GET /developers/1
  def show
  end

  # GET /developers/new
  def new
  end

  # GET /developers/1/edit
  def edit
  end

  # POST /developers
  def create
    respond_to do |format|
      if @developer.save
        format.html { redirect_to @developer, notice: "Developer was successfully created." }
      else
        format.html { render :new }
      end
    end
  end

  # PATCH/PUT /developers/1
  def update
    respond_to do |format|
      if @developer.update(developer_params)
        format.html { redirect_to @developer, notice: "Developer was successfully updated." }
      else
        format.html { render :edit }
      end
    end
  end

  # DELETE /developers/1
  def destroy
    @developer.destroy
    respond_to do |format|
      format.html { redirect_to developers_url, notice: "Developer was successfully destroyed." }
    end
  end

  private

  # Never trust parameters from the scary internet, only allow the white list through.
  def developer_params
    params.require(:developer).permit(
      :company_name,
      :head_office_address,
      :city,
      :county,
      :postcode,
      :email,
      :contact_number
    )
  end
end
