class PDF
 
  attr_reader :filepath, :folder, :filename
 
  def initialize( filepath )
    puts filepath
    @filepath = filepath
    @folder, @filename = File.split( filepath )
  end
  
  def filename_without_extension
    @filename.gsub( File.extname( @filename ), '')
  end
  
  
  def splice
    `pdftk #{self.filepath} burst output #{self.folder}/#{self.filename_without_extension}_page_%2d.pdf`
  end
  
  def image
    # do even more stuff
  end
  
  
end
