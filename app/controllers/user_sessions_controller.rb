class UserSessionsController < ApplicationController
  layout "login"
  
  def new
    @user_session = UserSession.new
  end
 
  def create
    @user_session = UserSession.new(params[:user_session])
    if @user_session.save
      flash[:notice] = "Usuário logado com sucesso."
      
      #VERIFICA SE EH O PRIMEIRO ACESSO
      if current_user.first_access
        puts "PRIMEIRO ACESSO"
        redirect_to first_step_path
      else
        puts "NAO EH PRIMEIRO ACESSO"
        redirect_to root_url
      end
      
    else
      render :action => 'new'
    end
  end
 
  def destroy
    @user_session = UserSession.find
    @user_session.destroy
    flash[:notice] = "Sessão finalizada com sucesso."
    redirect_to root_url
  end
end