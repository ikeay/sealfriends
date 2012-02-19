class AddPageIdToIntroductions < ActiveRecord::Migration
  def self.up
    add_column :introductions, :page_id, :integer
  end

  def self.down
    remove_column :introductions, :page_id
  end
end
