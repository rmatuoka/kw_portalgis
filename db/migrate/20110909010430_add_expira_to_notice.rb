class AddExpiraToNotice < ActiveRecord::Migration
  def self.up
    add_column :notices, :expira_em, :datetime
  end

  def self.down
    remove_column :notices, :expira_em
  end
end
