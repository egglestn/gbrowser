class SamplesController < ApplicationController
  load_and_authorize_resource

  def index
  end

  def new
  end

  def edit
  end

  def show
  end

  def create
    if @sample.save
      redirect_to @sample, notice: t("controller.success.create", name: @document.title)
    else
      render :new
    end
  end

  def update
    if @sample.update(sample_params)
      redirect_to @sample, notice: t("controller.success.update", name: @document.title)
    else
      render :edit
    end
  end

  def destroy
    @sample.destroy
    redirect_to samples_url, notice: t("controller.success.destroy", name: @document.title)
  end

  private

  # Never trust parameters from the scary internet, only allow the white list through.
  def document_params
    params.require(:sample).permit(:name )
  end
end
