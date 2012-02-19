class CreateIntroductions < ActiveRecord::Migration
  def self.up
    create_table :introductions do |t|
      t.text :comment
      t.string :name

      t.timestamps
    end
  end

  def self.down
    drop_table :introductions
  end
end
