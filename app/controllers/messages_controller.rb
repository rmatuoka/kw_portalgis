class MessagesController < ApplicationController
  before_filter :load_notices
  
  def index
    @messages = Message.all
  end
  
  def new
    @message = Message.new
    
    if params[:to].blank?
      flash[:notice] = "Mensagem sem destinatário."
      redirect_to messages_path
    else
      @to = User.first(:conditions => ['id = ?', params[:to]])
      
      if @to.blank?
        flash[:notice] = "Destinatário inexistente."
        redirect_to messages_path
      end
    end
  end
  
  def show
    #MARCA COMO LIDO
    #@read = current_user.message_read.first(:conditions => ["message_id = ?", params[:id]])
    #if !@read.read
    #  @read.read = true
    #  @read.save
    #  redirect_to message_path(params[:id])
    #end
    
    @message = Message.find(params[:id])

  end

  def create
    @message = Message.new(params[:message])
    if @message.save
      flash[:notice] = "Mensagem enviada com sucesso."
      redirect_to messages_path
    else
      render :action => 'new'
    end
  end

  def edit
    @message = Message.find(params[:id])
  end

  def update
    @message = Message.find(params[:id])
    if @message.update_attributes(params[:message])
      flash[:notice] = "Mensagem alterada com sucesso."
      redirect_to messages_path
    else
      render :action => 'edit'
    end
  end
  
  def destroy
    @message = Message.find(params[:id])
    @message.destroy
    redirect_to messages_path
  end
end
