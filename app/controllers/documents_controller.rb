class DocumentsController < ApplicationController

  def new
    @document = Document.new
  end
  
  def create
    @document = Document.new(params[:document])
    if @document.save
      redirect_to document_path(@document.key)
    end
    
  end
  
  def show
    @document = Document.find_by_key( params[:key] )
  end
  
  def download
    @document = Document.find_by_key( params[:key] )
    send_file(@document.pdf.path)
  end
  
end
