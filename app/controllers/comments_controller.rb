class CommentsController < ApplicationController
  before_filter :load_post
  def index
    @comments = Comment.all
  end
  
  def new
    @comment = @post.comments.build
  end

  def create
    @comment = @post.comments.new(params[:comment])
    if @comment.save
      flash[:notice] = "Comunicado cadastrado com sucesso."
      redirect_to root_path
    else
      render :action => 'new'
    end
  end

  def edit
    @comment = @post.comments.find(params[:id])
  end

  def update
    @comment = @post.comments.find(params[:id])
    if @comment.update_attributes(params[:comment])
      flash[:notice] = "Comunicado alterado com sucesso."
      redirect_to root_path
    else
      render :action => 'edit'
    end
  end
  
  def destroy
    @comment = current_user.posts.find(params[:id])
    @comment.destroy
    redirect_to root_path
  end
  
  def load_post
    @post = Post.find(params[:post_id])
  end
end
