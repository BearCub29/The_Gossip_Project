class CommentController < ApplicationController
  def create
    @anonymous = User.all.find_by(first_name: "Jean")
    @comment = Comment.new(content: params[:comment],user_id: @anonymous.id,gossip_id: params[:gossip_id] )
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
end