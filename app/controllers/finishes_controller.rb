class FinishesController < ApplicationController
  before_action :set_room
  before_action :set_finish, only: [:show, :edit, :update, :destroy]

  # GET /finishes
  # GET /finishes.json
  def index
    @finishes = @room.finishes.all
  end

  # GET /finishes/1
  # GET /finishes/1.json
  def show
  end

  # GET /finishes/new
  def new
    @finish = @room.finishes.new
  end

  # GET /finishes/1/edit
  def edit
  end

  # POST /finishes
  # POST /finishes.json
  def create
    @finish = @room.finishes.new(finish_params)

    respond_to do |format|
      if @finish.save
        format.html { redirect_to [@room, @finish], notice: 'Finish was successfully created.' }
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
    respond_to do |format|
      if @finish.update(finish_params)
        format.html { redirect_to [@room, @finish], notice: 'Finish was successfully updated.' }
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
      format.html { redirect_to room_finishes_url(@room), notice: 'Finish was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    def set_room
      @room = Room.find(params[:room_id])
      @development = @room.development
    end

    def set_finish
      @finish = Finish.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def finish_params
      params.require(:finish).permit(:room_id, :name, :category, :picture, documents_attributes: [:id, :title, :file, :_destroy])
    end
end
