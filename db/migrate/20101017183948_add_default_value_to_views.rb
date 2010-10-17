class AddDefaultValueToViews < ActiveRecord::Migration
  def self.up
    change_column :documents, :views, :integer, :default => 0
  end

  def self.down
  end
end
