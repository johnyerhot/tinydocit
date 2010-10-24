class AddNumberOfPagesAndConversionCompletedToDocuments < ActiveRecord::Migration
  def self.up
    add_column :documents, :number_of_pages, :integer, :default => 0
    add_column :documents, :conversion_completed, :boolean, :default => false
  end

  def self.down
    remove_column :documents, :number_of_pages
    remove_column :documents, :conversion_completed
  end
end
