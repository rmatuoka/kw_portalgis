class DashboardController < ApplicationController
  before_filter :load_notices
  
  def index
    @user = current_user
    @post = @user.posts.build
    
    @posts = Post.all(:order => "id DESC")
  end
end
