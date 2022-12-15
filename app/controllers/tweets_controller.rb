class TweetsController < ApplicationController
  def index
    @tweets = Tweet.order('created_at DESC')

    render 'tweets/index'
  end

  def index_by_user
    user = User.find_by(username: params[:username])
    @tweets = user.tweets

    render 'tweets/index'
  end

  def create
    token = cookies.permanent.signed[:twitter_session_token]
    session = Session.find_by(token: token)

    if session
      user = User.find_by(id: session.user_id)
      @tweet = user.tweets.create(tweet_params)

      render 'tweets/success_true' if @tweet.save
    else
      render json: {
        success: false
      }
    end
  end

  def destroy
    token = cookies.permanent.signed[:twitter_session_token]
    session = Session.find_by(token: token)

    if session
      user = User.find_by(id: session.user_id)
      tweet = user.tweets.find_by(params[:id])
      if session.user_id == tweet.user_id && tweet.destroy && tweet.destroy
        render json: {
          success: true
        }
      end
    else
      render json: {
        success: false
      }
    end
  end

  private

  def tweet_params
    params.require(:tweet).permit(:message)
  end
end
