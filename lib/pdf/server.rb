module PDF
  module Server
   
    def start
      beanstalk = Beanstalk::Pool.new(['localhost:11300'])
      loop do
        job = beanstalk.reserve
#        puts "Splicing PDF #{job.body}"
        process( job.body )
        job.delete
      end  
    end
    
    def process( filepath )
      pdf = PDF::Document.new( filepath )
      if pdf.splice
        pdf.image
      end
    end
    
  end
end  
  
