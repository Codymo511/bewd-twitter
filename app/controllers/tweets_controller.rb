class TweetsController < ApplicationController
  def index
    @tweets = Tweets.all
    render 'tweets/index'
  end

  def create
    token = cookies.signed[:twitter_session_token]
    session = Session.find_by(token: token)

    if session
      user = session.user
      @tweets = user.tweets.new(tweet_params)
      if @tweets.save
        render 'tweets/create'
      else
        render json: { success: false }
      end
    end
  end

  def tweet_params
    params.require(:tweet).permit(:content)
  end
end
