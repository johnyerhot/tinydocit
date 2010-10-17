require 'spec_helper'

describe DocumentsController do
  describe "#new" do
    
    it "should render the new page" do
      get :new
      response.should render_template("new")
    end
    
    it "should create a new document" do
      get :new
      assigns[:document].should be_new_record
    end
    
  end
  
  describe "#create" do
    
    before do
      @document = Factory.stub(:document)
      Document.stub(:new).and_return(@document)
      @document.stub(:save).and_return(true)
    end
    
    it "should create a new document" do
      Document.should_receive(:new).with("hi").and_return(@document)
      post :create, :document => "hi"
    end
    
    it "should redirect to #show" do
      @document.stub(:save).and_return(true)
      post :create, :document => "hi"
      response.should redirect_to(document_path(@document.key))
    end
    
  end
  
  describe "#show" do
    
    it "should retrieve document by key" do
      Document.should_receive(:find_by_key).with('foo').and_return( Factory.stub(:document) )
      get :show, :id => 'foo'
    end
    
    it "should render show page" do
      get :show, :id => 'foo'
      response.should render_template('show')      
    end
    
  end
  
  describe "#view" do
    before do
      @document = Factory.stub(:document) 
      @paths = ["/hi", "/there"]
      @document.stub(:fetch_jpg_paths).and_return(@paths)
      @document.stub(:log_viewing).and_return(true)
      Document.stub(:find_by_key).and_return(@document)
    end

    def do_get
      get :view, :key => 'foo'
    end
    
    it "should retrieve document by key" do
      Document.should_receive(:find_by_key).with('foo').and_return(@document)
      do_get
    end
    
    it "should render show page" do
      do_get
      response.should render_template('view')      
    end
    
    it "should log the viewing" do
      @document.should_receive(:log_viewing)
      do_get
    end

    it "should find jpg page paths" do
      do_get
      assigns[:pages].should == @paths
    end
  end
  
  
end
