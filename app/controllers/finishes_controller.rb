# frozen_string_literal: true
class FinishesController < ApplicationController
  load_and_authorize_resource :room
  load_and_authorize_resource :finish, through: :room

  # GET /finishes
  # GET /finishes.json
  def index
    @development = @room.development
  end

  # GET /finishes/1
  # GET /finishes/1.json
  def show
    @development = @room.development
  end

  # GET /finishes/new
  def new
    @development = @room.development
  end

  # GET /finishes/1/edit
  def edit
    @development = @room.development
  end

  # POST /finishes
  # POST /finishes.json
  def create
    @development = @room.development

    respond_to do |format|
      if @finish.save
        format.html { redirect_to [@room, @finish], notice: "Finish was successfully created." }
        format.json { render :show, status: :created, location: @finish }
      else
        format.html { render :new }
        format.json { render json: @finish.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /finishes/1
  # PATCH/PUT /finishes/1.json
  def update
    @development = @room.development

    respond_to do |format|
      if @finish.update(finish_params)
        format.html { redirect_to [@room, @finish], notice: "Finish was successfully updated." }
        format.json { render :show, status: :ok, location: @finish }
      else
        format.html { render :edit }
        format.json { render json: @finish.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /finishes/1
  # DELETE /finishes/1.json
  def destroy
    @finish.destroy
    respond_to do |format|
      # rubocop:disable LineLength
      format.html { redirect_to room_finishes_url(@room), notice: "Finish was successfully destroyed." }
      # rubocop:enable LineLength
      format.json { head :no_content }
    end
  end

  private

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
