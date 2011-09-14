class Notice < ActiveRecord::Base
  validates_presence_of :title, :message, :expira_em
  
  def self.all_published  
    Notice.all(:conditions => ['published = 1'], :order => "id DESC")
  end
end
