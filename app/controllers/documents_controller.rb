class DocumentsController < ApplicationController

  def new
    @document = Document.new
  end
  
  def create
    @document = Document.new(params[:document])
    if @document.save
      redirect_to @document
    end
    
  end
  
  def show
    @document = Document.find_by_key( params[:id] )
  end
  
end
