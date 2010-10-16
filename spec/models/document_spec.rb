require 'spec_helper'

describe Document do
  
  describe "generate_key" do

    it "should create a 6 character key" do
      @document = Document.new
      @document.save
      @document.key.length.should == 6
      
    end
    
    it "should make sure the key does not exist" do
      Document.should_receive(:find_by_key).at_least(1).times
      @document = Document.new
      @document.save
    end
    
  end

end
