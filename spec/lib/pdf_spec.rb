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

  describe "#filename_without_extension" do
    it "should return filename without extension" do
      @pdf = PDF.new( '/foo/bar/test.pdf')
      @pdf.filename_without_extension.should == 'test'      
    end
  end

  
  describe "#splice" do
    # shell execs a command
    # TODO: Figure out how to test
  end

  describe "#image" do
    
  end

  
end
