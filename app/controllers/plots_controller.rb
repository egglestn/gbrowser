# frozen_string_literal: true
class PlotsController < ApplicationController
  load_and_authorize_resource :development
  load_and_authorize_resource :plot, through: :development

  def index
  end

  def new
  end

  def edit
  end

  def show
    @all_documents = []
    @all_documents << @plot.unit_type.documents
    @all_documents << @plot.rooms.map(&:documents)
    @all_documents << @plot.finishes.map(&:documents)
    @all_documents << @plot.documents
    @all_documents.flatten!
  end

  def create
    if @plot.save
      redirect_to [@development, @plot], notice: "Plot was successfully created."
    else
      render :new
    end
  end

  def update
    if @plot.update(plot_params)
      redirect_to [@development, @plot], notice: "Plot was successfully updated."
    else
      frender :edit
    end
  end

  def destroy
    @plot.destroy
    redirect_to development_plots_url, notice: "Plot was successfully destroyed."
  end

  private

  # Never trust parameters from the scary internet, only allow the white list through.
  def plot_params
    params.require(:plot).permit(
      :prefix,
      :number,
      :unit_type_id,
      documents_attributes: [:id, :title, :file, :_destroy]
    )
  end
end
