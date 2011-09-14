class PostsController < ApplicationController
  def index
    @posts = Post.all
  end
  
  def new
    @post = current_user.posts.build
  end

  def create
    @post = current_user.posts.new(params[:post])
    if @post.save
      flash[:notice] = "Comunicado cadastrado com sucesso."
      redirect_to root_path
    else
      render :action => 'new'
    end
  end

  def edit
    @post = current_user.posts.find(params[:id])
  end

  def update
    @post = current_user.posts.find(params[:id])
    if @post.update_attributes(params[:post])
      flash[:notice] = "Comunicado alterado com sucesso."
      redirect_to root_path
    else
      render :action => 'edit'
    end
  end
  
  def destroy
    @post = current_user.posts.find(params[:id])
    @post.destroy
    redirect_to root_path
  end
end
