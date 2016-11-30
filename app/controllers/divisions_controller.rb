# frozen_string_literal: true
class DivisionsController < ApplicationController
  load_and_authorize_resource :developer
  load_and_authorize_resource :division, through: :developer

  # GET /divisions
  def index
  end

  # GET /divisions/1
  def show
  end

  # GET /divisions/new
  def new
  end

  # GET /divisions/1/edit
  def edit
  end

  # POST /divisions
  def create
    respond_to do |format|
      if @division.save
        # rubocop:disable LineLength
        format.html { redirect_to [@developer, @division], notice: "Division was successfully created." }
        # rubocop:enable LineLength
      else
        format.html { render :new }
      end
    end
  end

  # PATCH/PUT /divisions/1
  def update
    respond_to do |format|
      if @division.update(division_params)
        # rubocop:disable LineLength
        format.html { redirect_to [@developer, @division], notice: "Division was successfully updated." }
        # rubocop:enable LineLength
      else
        format.html { render :edit }
      end
    end
  end

  # DELETE /divisions/1
  def destroy
    @division.destroy
    respond_to do |format|
      # rubocop:disable LineLength
      format.html { redirect_to developer_divisions_url, notice: "Division was successfully destroyed." }
      # rubocop:enable LineLength
    end
  end

  private

  # Never trust parameters from the scary internet, only allow the white list through.
  def division_params
    params.require(:division).permit(
      :division_name,
      :address,
      :city,
      :county,
      :postcode,
      :email,
      :contact_number
    )
  end
end
