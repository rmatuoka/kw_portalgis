class User < ActiveRecord::Base
  has_attached_file :avatar, :styles => { :profile => "139x360>", :icon => "36x36>" }
  acts_as_authentic
  
  validates_presence_of :name, :phone, :rg, :cpf, :phone1, :phone2, :ae_ae, :ae_profile, :ae_address, :ae_region, :ae_neighborhood, :ae_city, :ae_state, :ae_cep
  
  has_many :posts
  has_many :notice_read
  has_many :notices, :through => :notice_read

  
  def self.find_by_name(name)  
    User.first(:conditions => ['username = ?', name])
  end
end
