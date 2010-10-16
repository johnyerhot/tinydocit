class Document < ActiveRecord::Base
  before_save :set_key
  before_save :check_key
  
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
