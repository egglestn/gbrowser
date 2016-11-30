# frozen_string_literal: true
class DocumentsController < ApplicationController
  load_and_authorize_resource

  # GET /documents
  def index
  end

  # GET /documents/1
  def show
  end

  # GET /documents/new
  def new
  end

  # GET /documents/1/edit
  def edit
  end

  # POST /documents
  def create
    respond_to do |format|
      if @document.save
        format.html { redirect_to @document, notice: "Document was successfully created." }
      else
        format.html { render :new }
      end
    end
  end

  # PATCH/PUT /documents/1
  def update
    respond_to do |format|
      if @document.update(document_params)
        format.html { redirect_to @document, notice: "Document was successfully updated." }
      else
        format.html { render :edit }
      end
    end
  end

  # DELETE /documents/1
  def destroy
    @document.destroy
    respond_to do |format|
      format.html { redirect_to documents_url, notice: "Document was successfully destroyed." }
    end
  end

  private

  # Never trust parameters from the scary internet, only allow the white list through.
  def document_params
    params.require(:document).permit(:title, :file)
  end
end
