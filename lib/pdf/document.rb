module PDF
  class Document
   
    attr_reader :filepath, :folder, :filename

    def initialize( filepath )
      @filepath = filepath
      @folder, @filename = File.split( @filepath )
    end

    def filename_without_extension
      @filename.gsub( File.extname( @filename ), '')
    end

    def splice
      begin
        `pdftk #{self.filepath} burst output #{self.folder}/%01d_page.pdf`
        true
      rescue
        false
      end
    end

    def image
      puts "Imaging #{self.filepath}"
      begin
        pages = File.join( self.folder , "*_page.pdf" )
        Dir.glob( pages ).sort.each do |page|
          puts "Converting #{page} to image"
            `convert -density 96 -quality 90 -resize 600x -quiet #{page} #{page.gsub(/\.pdf/, '.jpg')} > /dev/null`
          end
      rescue
        false
      end
    end
   
  end
end  
