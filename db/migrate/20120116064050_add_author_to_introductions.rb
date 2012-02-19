class AddAuthorToIntroductions < ActiveRecord::Migration
  def self.up
    add_column :introductions, :author, :integer
  end

  def self.down
    remove_column :introductions, :author
  end
end
