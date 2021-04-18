class PostCommentsController < ApplicationController

  def create
    @beer = Beer.find(params[:beer_id])
    @comment = current_user.post_comments.new(post_comment_params)
    @comment.beer_id = @beer.id
    @comment.save
    @comments = @beer.post_comments.all.order(created_at: :desc).page(params[:page]).per(10)
  end

  def destroy
    @beer = Beer.find(params[:beer_id])
    @comment = PostComment.find_by(id: params[:id], beer_id: params[:beer_id])
    @comment.destroy
    @comments = @beer.post_comments.all.order(created_at: :desc).page(params[:page]).per(10)
  end

  private

  def post_comment_params
    params.require(:post_comment).permit(:comment, :rate)
  end
end
