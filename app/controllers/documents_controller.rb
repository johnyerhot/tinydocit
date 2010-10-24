class DocumentsController < ApplicationController

  def new
    @document = Document.new
  end
  
  def create
    @document = Document.new(params[:document])
    if @document.save
      redirect_to document_path(@document.key)
    else
      render :new
    end
  end
  
  def show
    @document = Document.find_by_key( params[:id] )
  end

  def view
    @document = Document.find_by_key( params[:key] )
    if @document
      @document.log_viewing if @document.completed?
      render :layout => "view_pdf"
    else
      render :status => 404, :file => "public/404.html", :layout => false
    end
  end
  
  def download
    @document = Document.find_by_key( params[:key] )
    # for nginx 
    head(:x_accel_redirect => "/pdfs/#{@document.id}/#{@document.id}_original.pdf", :content_type => @document.pdf.content_type)

#    send_file(@document.pdf.path, :type => @document.pdf.content_type)
  end

end
