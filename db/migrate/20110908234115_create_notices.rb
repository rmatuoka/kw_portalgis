class CreateNotices < ActiveRecord::Migration
  def self.up
    create_table :notices do |t|
      t.string :title
      t.text :message
      t.integer :created_by
      t.boolean :published, :default => 0

      t.timestamps
    end
  end

  def self.down
    drop_table :notices
  end
end
