class Document < ActiveRecord::Base
  
  has_attached_file :pdf,
  :path => ':rails_root/public/system/pdfs/:id/:id.:extension'
  
  before_save :set_key
  before_save :check_key
  
  validates_attachment_size :pdf, :less_than => 2.megabyte, :message => "Sorry, we've only got one tiny server and anything over 2MB makes it want to crawl over and die.  Vote for our app and we might be a bigger server and then maybe up the size limit. Until then, 2MB only."
  validates_attachment_content_type :pdf, :content_type=>['application/pdf'], :message => "Sorry, PDF only buddy."


  def set_key
    self.key = generate_key
  end
  
  def check_key
    doc = Document.find_by_key(self.key)
    if doc
      self.key = generate_key
      check_key
    end
  end
  
  def generate_key
    ActiveSupport::SecureRandom.hex(12)[0..5]
  end
  
end
