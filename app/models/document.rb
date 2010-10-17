class Document < ActiveRecord::Base
  
  has_attached_file :pdf,
  :path => ':rails_root/public/system/pdfs/:id/:id_original.:extension'
  
  before_create :set_key
  before_create :check_key
  
  validates_attachment_size :pdf, 
  :less_than => 3.megabyte, 
  :message => "Sorry, we've only got one tiny server and anything over 2MB makes it want to crawl over and die.  Vote for our app and we might be a bigger server and then maybe up the size limit. Until then, 2MB only."
  
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
  
  def fetch_jpg_paths
    path = "#{Rails.root.to_s}/public/system/pdfs/#{self.id}/*_page.jpg"
    @pages = Dir.glob(path)
  end

  def log_viewing
    # don't use increment, do it in one update
    update_attributes(:last_viewed_at => Time.now, :views => self.views += 1)
  end
  
end
