class CreateReplies < ActiveRecord::Migration
  def self.up
    create_table :replies do |t|
      t.integer :message_id
      t.text :message
      t.integer :user_id
      t.boolean :read

      t.timestamps
    end
  end

  def self.down
    drop_table :replies
  end
end
