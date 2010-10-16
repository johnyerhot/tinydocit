class AddPaperclipColumnsToDocuments < ActiveRecord::Migration
  def self.up
    add_column :documents, :pdf_file_name,    :string
    add_column :documents, :pdf_content_type, :string
    add_column :documents, :pdf_file_size,    :integer
    add_column :documents, :pdf_updated_at,   :datetime
  end

  def self.down
  end
end
