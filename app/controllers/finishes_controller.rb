# frozen_string_literal: true
class FinishesController < ApplicationController
  load_and_authorize_resource :room
  load_and_authorize_resource :finish, through: :room
  before_action :set_development

  # GET /finishes
  def index
  end

  # GET /finishes/1
  def show
  end

  # GET /finishes/new
  def new
  end

  # GET /finishes/1/edit
  def edit
  end

  # POST /finishes
  def create
    respond_to do |format|
      if @finish.save
        format.html { redirect_to [@room, @finish], notice: "Finish was successfully created." }
      else
        format.html { render :new }
      end
    end
  end

  # PATCH/PUT /finishes/1
  def update
    respond_to do |format|
      if @finish.update(finish_params)
        format.html { redirect_to [@room, @finish], notice: "Finish was successfully updated." }
      else
        format.html { render :edit }
      end
    end
  end

  # DELETE /finishes/1
  def destroy
    @finish.destroy
    respond_to do |format|
      # rubocop:disable LineLength
      format.html { redirect_to room_finishes_url(@room), notice: "Finish was successfully destroyed." }
      # rubocop:enable LineLength
    end
  end

  private

  def set_development
    @development = @room.development
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def finish_params
    params.require(:finish).permit(
      :room_id,
      :name,
      :category,
      :picture,
      documents_attributes: [:id, :title, :file, :_destroy]
    )
  end
end
