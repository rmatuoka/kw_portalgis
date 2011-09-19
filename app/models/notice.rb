class Notice < ActiveRecord::Base
  validates_presence_of :title, :message, :expira_em
  
  #ASSOCIATIONS
  has_many :notice_read
  has_many :users, :through => :notice_read
  
  def self.all_published  
    Notice.all(:conditions => ['published = 1'], :order => "id DESC")
  end
end
