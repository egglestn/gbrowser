# frozen_string_literal: true
class DevelopmentsController < ApplicationController
  load_and_authorize_resource

  # GET /developments
  # GET /developments.json
  def index
  end

  # GET /developments/1
  # GET /developments/1.json
  def show
  end

  # GET /developments/new
  def new
  end

  # GET /developments/1/edit
  def edit
  end

  # POST /developments
  # POST /developments.json
  def create
    respond_to do |format|
      if @development.save
        format.html { redirect_to @development, notice: "Development was successfully created." }
        format.json { render :show, status: :created, location: @development }
      else
        format.html { render :new }
        format.json { render json: @development.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /developments/1
  # PATCH/PUT /developments/1.json
  def update
    respond_to do |format|
      if @development.update(development_params)
        format.html { redirect_to @development, notice: "Development was successfully updated." }
        format.json { render :show, status: :ok, location: @development }
      else
        format.html { render :edit }
        format.json { render json: @development.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /developments/1
  # DELETE /developments/1.json
  def destroy
    @development.destroy
    respond_to do |format|
      format.html { redirect_to developments_url, notice: "Development was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private

  # Never trust parameters from the scary internet, only allow the white list through.
  def development_params
    params.require(:development).permit(:development_name, :developer_id, :division_id, :office_address, :city, :county, :postcode, :email, :contact_number)
  end
end
