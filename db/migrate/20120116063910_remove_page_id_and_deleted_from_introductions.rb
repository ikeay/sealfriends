class RemovePageIdAndDeletedFromIntroductions < ActiveRecord::Migration
  def self.up
    remove_column :introductions, :page_id
  end

  def self.down
    add_column :introductions, :page_id, :insteger
  end
end
