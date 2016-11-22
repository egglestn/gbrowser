# frozen_string_literal: true
class DivisionsController < ApplicationController
  load_and_authorize_resource :developer
  load_and_authorize_resource :division, through: :developer

  # GET /divisions
  # GET /divisions.json
  def index
  end

  # GET /divisions/1
  # GET /divisions/1.json
  def show
  end

  # GET /divisions/new
  def new
  end

  # GET /divisions/1/edit
  def edit
  end

  # POST /divisions
  # POST /divisions.json
  def create
    respond_to do |format|
      if @division.save
        format.html { redirect_to [@developer, @division], notice: "Division was successfully created." }
        format.json { render :show, status: :created, location: @division }
      else
        format.html { render :new }
        format.json { render json: @division.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /divisions/1
  # PATCH/PUT /divisions/1.json
  def update
    respond_to do |format|
      if @division.update(division_params)
        format.html { redirect_to [@developer, @division], notice: "Division was successfully updated." }
        format.json { render :show, status: :ok, location: @division }
      else
        format.html { render :edit }
        format.json { render json: @division.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /divisions/1
  # DELETE /divisions/1.json
  def destroy
    @division.destroy
    respond_to do |format|
      format.html { redirect_to developer_divisions_url, notice: "Division was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private

  # Never trust parameters from the scary internet, only allow the white list through.
  def division_params
    params.require(:division).permit(:division_name, :address, :city, :county, :postcode, :email, :contact_number)
  end
end
