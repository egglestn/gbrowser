# frozen_string_literal: true
class SamplesController < ApplicationController
  load_and_authorize_resource
  include PaginationConcern

  def index
    @samples = paginate(@samples)
  end

  def new
  end

  def edit
  end

  def show
  end

  def create
    if @sample.save
      redirect_to @sample, notice: t("controller.success.create", name: @sample.name)
    else
      render :new
    end
  end

  def update
    if @sample.update(sample_params)
      redirect_to @sample, notice: t("controller.success.update", name: @sample.name)
    else
      render :edit
    end
  end

  def destroy
    @sample.destroy
    redirect_to samples_url, notice: t("controller.success.destroy", name: :sample.name)
  end

  private

  # Never trust parameters from the scary internet, only allow the white list through.
  def sample_params
    params.require(:sample).permit(:name)
  end
end
