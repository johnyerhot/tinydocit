class DocumentObserver < ActiveRecord::Observer
  
  observe :document
  
  def after_create( document )
    beanstalk = Beanstalk::Pool.new(['localhost:11300'])
    beanstalk.put( document.pdf.path )
  end
  
end
