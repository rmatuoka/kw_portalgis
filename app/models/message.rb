class Message < ActiveRecord::Base
    
  has_many :replies
end
