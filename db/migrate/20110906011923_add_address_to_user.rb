class AddAddressToUser < ActiveRecord::Migration
  def self.up
    add_column :users, :ae_address, :string
    add_column :users, :ae_complement, :string
    add_column :users, :ae_neighborhood, :string
  end

  def self.down
    remove_column :users, :ae_neighborhood
    remove_column :users, :ae_complement
    remove_column :users, :ae_address
  end
end
