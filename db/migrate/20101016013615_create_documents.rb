class CreateDocuments < ActiveRecord::Migration
  def self.up
    create_table :documents do |t|
      t.string :key
      t.integer :views
      t.datetime :last_viewed_at
      t.timestamps
    end
    
    add_index :documents, :key
  end

  def self.down
    drop_table :documents
  end
end
