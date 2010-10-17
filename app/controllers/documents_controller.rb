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
      @pages = @document.fetch_jpg_paths
      @document.log_viewing unless @pages.empty?

      render :layout => "view_pdf"
    else
      render :status => 404, :file => "public/404.html", :layout => false
    end
  end
  
  def download
    @document = Document.find_by_key( params[:key] )
    send_file(@document.pdf.path, :type => @document.pdf.content_type)
  end

end
