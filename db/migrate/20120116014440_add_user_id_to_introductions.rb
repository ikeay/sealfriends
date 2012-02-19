class AddUserIdToIntroductions < ActiveRecord::Migration
  def self.up
    add_column :introductions, :user_id, :integer
  end

  def self.down
    remove_column :introductions, :user_id
  end
end
