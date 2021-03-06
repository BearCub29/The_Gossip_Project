class CommentController < ApplicationController
  before_action :authenticate_user, only: [:create]
  def create
    @comment = Comment.new(content: params[:comment],user_id: current_user.id,gossip_id: params[:gossip_id] )
    @comment.save
    redirect_to gossip_path(params[:gossip_id])
  end
  def edit
    puts "&" * 60
    puts params.inspect
    puts "&" * 60
    @comment = Comment.find(params[:id])
    puts "&" *60
    puts @comment.inspect
  end
  def update
    @comment = Comment.find(params[:id])
    puts "&" *60
    puts @comment.inspect
    comment_update = params.require(:comment).permit(:content)
    if @comment.update(comment_update)
      redirect_to gossip_path(params[:gossip_id])
    else
      render :edit
    end
  end
  def destroy
    @comment = Comment.find(params[:id])
    @comment.destroy
    redirect_to gossip_path(params[:gossip_id])

  end
  private

  def authenticate_user
    unless current_user
      flash[:danger] = "Please log in."
      redirect_to new_session_path
    end
  end

end