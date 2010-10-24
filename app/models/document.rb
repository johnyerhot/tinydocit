class Document < ActiveRecord::Base
  
  has_attached_file :pdf,
  :path => ':rails_root/public/system/pdfs/:key/:id_original.:extension'
  
  before_create :set_key
  before_create :check_key
  
  validates_attachment_size :pdf, 
  :less_than => 10.megabyte, 
  :message => "Documents cannot be larger than 10MB"
  
  validates_attachment_content_type :pdf, :content_type=>['application/pdf', 'application/octet-stream'], :message => "Sorry, PDF only buddy."


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
  
  def complted?
    conversion_completed
  end
  

  def completed?
    unless conversion_completed
      finished = File.exists?("#{Rails.root.to_s}/public/system/pdfs/#{self.key}/finished.txt")

      if finished
        path = "#{Rails.root.to_s}/public/system/pdfs/#{self.key}/*_page.jpg"
        pages ||= Dir.glob(path)
        update_attributes(:conversion_completed => true, 
                          :number_of_pages => (pages.length))
        reload
      else
        return false
      end
    end
    true
  end
  
  def log_viewing
    # don't use increment, do it in one update
    update_attributes(:last_viewed_at => Time.now, :views => self.views += 1)
  end
  
end
