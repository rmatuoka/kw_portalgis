class ProfileController < ApplicationController
  layout "profile"
  before_filter :load_notices
  
  def index
    @user = User.find_by_name(params[:user])
    @posts = @user.posts.all(:order => "id DESC")
  end
end
