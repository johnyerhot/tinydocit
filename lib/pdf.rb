require 'beanstalk-client'

module PDF
 
  autoload :Document,     'pdf/document'
  autoload :Logger,       'pdf/logger'
  autoload :Server,       'pdf/server'
  
  extend Server
  
  
end
