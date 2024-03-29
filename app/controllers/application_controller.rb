class ApplicationController < ActionController::Base
  protect_from_forgery
  
  #Authlogic

  helper_method :current_user

  private

  def current_user_session
    return @current_user_session if defined?(@current_user_session)
    @current_user_session = UserSession.find
  end

  def current_user
    return @current_user if defined?(@current_user)
    @current_user = current_user_session && current_user_session.record
  end
  
  def load_notices
    #@notices_view = current_user.notices.all_published
    @notices_view = NoticeRead.all(:conditions => ["user_id = ?", current_user])
  
    @friends = User.all(:conditions => ["first_access < 1"])
  end
end
