# frozen_string_literal: true
class RoomsController < ApplicationController
  load_and_authorize_resource :development
  load_and_authorize_resource :room, through: :development

  # GET /rooms
  # GET /rooms.json
  def index
  end

  # GET /rooms/1
  # GET /rooms/1.json
  def show
  end

  # GET /rooms/new
  def new
  end

  # GET /rooms/1/edit
  def edit
  end

  # POST /rooms
  # POST /rooms.json
  def create
    respond_to do |format|
      if @room.save
        format.html { redirect_to [@development, @room], notice: "Room was successfully created." }
        format.json { render :show, status: :created, location: @room }
      else
        format.html { render :new }
        format.json { render json: @room.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /rooms/1
  # PATCH/PUT /rooms/1.json
  def update
    respond_to do |format|
      if @room.update(room_params)
        format.html { redirect_to [@development, @room], notice: "Room was successfully updated." }
        format.json { render :show, status: :ok, location: @room }
      else
        format.html { render :edit }
        format.json { render json: @room.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /rooms/1
  # DELETE /rooms/1.json
  def destroy
    @room.destroy
    respond_to do |format|
      format.html { redirect_to development_rooms_url(@development), notice: "Room was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private

  # Never trust parameters from the scary internet, only allow the white list through.
  def room_params
    params.require(:room).permit(:name, :unit_type_id, documents_attributes: [:id, :title, :file, :_destroy])
  end
end
