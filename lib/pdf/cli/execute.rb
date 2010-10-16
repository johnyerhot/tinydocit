module PDF
  module CLI
    class Execute

      def initialize(options)
        @options = options
        start
      end 

      def start
        if @options[:daemonize] == true
          start_daemonized
        else
          PDF.start
        end
      end


      def start_daemonized
        Signal.trap('HUP') {}
        
        pid = fork do
          begin
            require 'pdf'
          
            PDF.start
          rescue => e
            puts e.message
            puts e.backtrace.join("\n")
            abort "There was a fatal system error starting PDF Server."
          end
        end

      end 
      
    end
  end
end
  