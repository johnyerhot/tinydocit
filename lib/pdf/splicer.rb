module PDF
  module Splicer
  
    def splice( filepath )
      @filepath = filepath
      @folder, @filename = File.split( filepath )
      splice!
    end
  
    def filename
      @filename
    end
    
    def folder
      @folder
    end
  
    def filepath
      @filepath
    end
  
    def splice!
      # do stuff
    end
  
  
  
  
  end
end