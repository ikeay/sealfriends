class RemoveImageAndDeletedFromPictures < ActiveRecord::Migration
  def self.up
    remove_column :pictures, :image
  end

  def self.down
    add_column :pictures, :image, :binary
  end
end
