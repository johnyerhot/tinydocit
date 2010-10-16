require File.dirname(__FILE__) + '/../spec_helper'

describe PDF do

  describe "#splice" do
    
    it "should accept filepath" do
      PDF.should_receive(:splice).with('/foo/bar/test.pdf')
      PDF.splice( '/foo/bar/test.pdf')
    end
    
    
    it "should set filename" do
      PDF.splice( '/foo/bar/test.pdf')
      PDF.filename.should == 'test.pdf'
    end
    
    it "should set filepath" do
      PDF.splice( '/foo/bar/test.pdf')
      PDF.filepath.should == '/foo/bar/test.pdf'
    end
    
    it "should set folder" do
      PDF.splice( '/foo/bar/test.pdf')
      PDF.folder.should == '/foo/bar'
    end
     
  end


end
