class RemoveNameAndDeletedFromIntroductions < ActiveRecord::Migration
  def self.up
    remove_column :introductions, :name
  end

  def self.down
    add_column :introductions, :name, :string
  end
end
