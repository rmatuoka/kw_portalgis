class CreateNoticeReads < ActiveRecord::Migration
  def self.up
    create_table :notice_reads do |t|
      t.integer :user_id
      t.integer :notice_id
      t.boolean :read, :default => 0

      t.timestamps
    end
  end

  def self.down
    drop_table :notice_reads
  end
end
