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

  describe "log_viewing" do

    before do
      @document = Factory(:document, :views => 2)
    end

    it "should increment the view count" do
      @document.log_viewing
      @document.views.should == 3
    end
    
    it "should update the last_viewed_at" do
      time = Time.now
      Time.stub(:now).and_return(time)
      @document.log_viewing
      @document.last_viewed_at.should == time
    end
  end
end
