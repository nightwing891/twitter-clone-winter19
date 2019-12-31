class Api::TweetsController < ApplicationController
  def index
    render json: Tweet.all
  end

  def create
    @tweet = Tweet.new(tweet_params)
    if @tweet.save
      render json: @tweet
    else
      render json: { errors: @tweet.errors }, status: :unprocessable_entity
    end
  end

  def update
    @tweet = Tweet.find(params[:id])
    if @tweet.update(tweet_params)
      render json: @tweet
    else
      render json: { errors: @tweet.errors }, status: :unprocessable_entity
    end
  end

  def destroy  
    Tweet.find(params[:id]).destroy
    render json: { message: 'Tweet Destroyed' }
  end

  private
    def tweet_params
      params.require(:tweet).permit(:title, :author, :body)
    end
end
