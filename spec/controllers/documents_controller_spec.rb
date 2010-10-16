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
      response.should redirect_to(document_path(@document))
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
  
  
end
