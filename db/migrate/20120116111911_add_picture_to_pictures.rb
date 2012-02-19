class AddPictureToPictures < ActiveRecord::Migration
  def self.up
    add_column :pictures, :picture_data, :binary
    add_column :pictures, :content_type, :string
  end

  def self.down
    remove_column :pictures, :content_type
    remove_column :pictures, :picture_data
  end
end
