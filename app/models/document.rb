class Document < ActiveRecord::Base
  
  has_attached_file :pdf
  
  before_save :set_key
  before_save :check_key
  
  validates_attachment_size :pdf, :less_than => 5.megabyte
  validates_attachment_content_type :pdf, :content_type=>['application/pdf'] 
  
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
