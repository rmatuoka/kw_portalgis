class AddItensToUser < ActiveRecord::Migration
  def self.up
    add_column :users, :name, :string
    add_column :users, :phone, :string
    add_column :users, :rg, :string
    add_column :users, :cpf, :string
    add_column :users, :phone1, :string
    add_column :users, :phone2, :string
    add_column :users, :phone3, :string
    add_column :users, :ae_ae, :string
    add_column :users, :ae_profile, :string
    add_column :users, :ae_region, :string
    add_column :users, :ae_city, :string
    add_column :users, :ae_state, :string
    add_column :users, :ae_cep, :string
    add_column :users, :first_access, :boolean, :default => 1
  end

  def self.down
    remove_column :users, :first_access
    remove_column :users, :ae_cep
    remove_column :users, :ae_state
    remove_column :users, :ae_city
    remove_column :users, :ae_region
    remove_column :users, :ae_profile
    remove_column :users, :ae_ae
    remove_column :users, :phone3
    remove_column :users, :phone2
    remove_column :users, :phone1
    remove_column :users, :cpf
    remove_column :users, :rg
    remove_column :users, :phone
    remove_column :users, :name
  end
end
