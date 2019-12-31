class Api::CommentsController < ApplicationController
  before_action :set_tweet

  def index
    render json: @tweet.comments 
  end

  def create
    @comment = @tweet.comments.new(comments_params)
    if @comment.save
      render json: @comment
    else
      render json: { errors: @comment.errors }, status: :unprocessable_entity
    end
  end

  def update
    @comment = @tweet.comments.find(params[:id])
    if @comment.update(comments_params)
      render json: @comment
    else
      render json: { errors: @comment.errors }, status: :unprocessable_entity
    end
  end

  def destroy
    @tweet.comments.find(params[:id]).destroy
    render json: { message: 'Item deleted' }
  end

  private
    def comments_params
      params.require(:comment).permit(:author, :body)
    end

    def set_tweet
      @tweet = Tweet.find(params[:tweet_id])
    end
end
