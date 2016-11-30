# frozen_string_literal: true
class RoomsController < ApplicationController
  load_and_authorize_resource :development
  load_and_authorize_resource :room, through: :development

  # GET /rooms
  def index
  end

  # GET /rooms/1
  def show
  end

  # GET /rooms/new
  def new
  end

  # GET /rooms/1/edit
  def edit
  end

  # POST /rooms
  def create
    respond_to do |format|
      if @room.save
        format.html { redirect_to [@development, @room], notice: "Room was successfully created." }
      else
        format.html { render :new }
      end
    end
  end

  # PATCH/PUT /rooms/1
  def update
    respond_to do |format|
      if @room.update(room_params)
        format.html { redirect_to [@development, @room], notice: "Room was successfully updated." }
      else
        format.html { render :edit }
      end
    end
  end

  # DELETE /rooms/1
  def destroy
    @room.destroy
    respond_to do |format|
      # rubocop:disable LineLength
      format.html { redirect_to development_rooms_url(@development), notice: "Room was successfully destroyed." }
      # rubocop:enable LineLength
    end
  end

  private

  # Never trust parameters from the scary internet, only allow the white list through.
  def room_params
    params.require(:room).permit(
      :name,
      :unit_type_id,
      documents_attributes: [:id, :title, :file, :_destroy]
    )
  end
end
