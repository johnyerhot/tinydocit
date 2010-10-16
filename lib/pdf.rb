class PDF
 
  attr_reader :filepath, :folder, :filename
  
  def initialize( filepath ) 
    @filepath = filepath
    @folder, @filename = File.split( filepath )
  end
  
  def splice
    # do stuff
  end
  
  def image
    # do even more stuff
  end
  
  
end