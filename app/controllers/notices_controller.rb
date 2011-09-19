class NoticesController < ApplicationController
  before_filter :load_notices
  
  def index
    @notices = Notice.all
  end
  
  def new
    @notice = Notice.new
  end
  
  def show
    #MARCA COMO LIDO
    @read = current_user.notice_read.first(:conditions => ["notice_id = ?", params[:id]])
    if !@read.read
      @read.read = true
      @read.save
      redirect_to notice_path(params[:id])
    end
    
    @notice = Notice.find(params[:id])

  end

  def create
    @notice = Notice.new(params[:notice])
    if @notice.save
      #SALVA COMUNICADO PARA TODOS USUARIOS
      $users = User.all
      $users.each do |user|
        $notice = NoticeRead.new
        $notice.notice_id = @notice.id
        $notice.user_id = user.id
        $notice.save
      end
      
      flash[:notice] = "Comunicado cadastrado com sucesso."
      redirect_to notices_path
    else
      render :action => 'new'
    end
  end

  def edit
    @notice = Notice.find(params[:id])
  end

  def update
    @notice = Notice.find(params[:id])
    @notice.created_by = current_user.id
    if @notice.update_attributes(params[:notice])
      flash[:notice] = "Comunicado alterado com sucesso."
      redirect_to notices_path
    else
      render :action => 'edit'
    end
  end
  
  def destroy
    @notice = Notice.find(params[:id])
    @notice.destroy
    redirect_to notices_path
  end
end
