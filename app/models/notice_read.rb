class NoticeRead < ActiveRecord::Base
  belongs_to :notice
  belongs_to :user
  
  def self.five_notices  
    NoticeRead.all(:limit => 5, :order => "id DESC")
  end
end
