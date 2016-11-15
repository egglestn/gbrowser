class PlotsController < ApplicationController
  load_and_authorize_resource :development
  load_and_authorize_resource :plot, through: :development

  # GET /plots
  # GET /plots.json
  def index
  end

  # GET /plots/1
  # GET /plots/1.json
  def show
    @all_documents = []
    @all_documents << @plot.unit_type.documents
    @all_documents << @plot.rooms.map(&:documents)
    @all_documents << @plot.finishes.map(&:documents)
    @all_documents << @plot.documents
    @all_documents.flatten!
  end

  # GET /plots/new
  def new
  end

  # GET /plots/1/edit
  def edit
  end

  # POST /plots
  # POST /plots.json
  def create
    respond_to do |format|
      if @plot.save
        format.html { redirect_to [@development, @plot], notice: 'Plot was successfully created.' }
        format.json { render :show, status: :created, location: @plot }
      else
        format.html { render :new }
        format.json { render json: @plot.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /plots/1
  # PATCH/PUT /plots/1.json
  def update
    respond_to do |format|
      if @plot.update(plot_params)
        format.html { redirect_to [@development, @plot], notice: 'Plot was successfully updated.' }
        format.json { render :show, status: :ok, location: @plot }
      else
        format.html { render :edit }
        format.json { render json: @plot.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /plots/1
  # DELETE /plots/1.json
  def destroy
    @plot.destroy
    respond_to do |format|
      format.html { redirect_to development_plots_url, notice: 'Plot was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Never trust parameters from the scary internet, only allow the white list through.
    def plot_params
      params.require(:plot).permit(:prefix, :number, :unit_type_id, documents_attributes: [:id, :title, :file, :_destroy])
    end
end
