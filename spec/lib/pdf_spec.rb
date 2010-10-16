require File.dirname(__FILE__) + '/../spec_helper'

describe PDF do

  describe "#initialize" do
    
    before do
      @pdf = PDF.new( '/foo/bar/test.pdf')
    end
    
    it "should set filename" do
      @pdf.filename.should == 'test.pdf'
    end
    
    it "should set filepath" do
      @pdf.filepath.should == '/foo/bar/test.pdf'
    end
    
    it "should set folder" do
      @pdf.folder.should == '/foo/bar'
    end
     
  end
  
  describe "#splice" do
    
  end


  describe "#image" do
    
  end

  
end
