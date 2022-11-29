class IndexController < ApplicationController
  def index
    @config = {
      twitter_consumer_key: cookies[:twitter_consumer_key],
      twitter_consumer_secret: cookies[:twitter_consumer_secret],
      twitter_access_token: cookies[:twitter_access_token],
      twitter_access_token_secret: cookies[:twitter_access_token_secret]
    }
  end

  def save
    consumer_key = params[:twitter_consumer_key]
    consumer_secret = params[:twitter_consumer_secret]
    access_token = params[:twitter_access_token]
    access_token_secret = params[:twitter_access_token_secret]

    cookies[:twitter_consumer_key] = consumer_key
    cookies[:twitter_consumer_secret] = consumer_secret
    cookies[:twitter_access_token] = access_token
    cookies[:twitter_access_token_secret] = access_token_secret

    client = Twitter::REST::Client.new do |config|
      config.consumer_key        = consumer_key
      config.consumer_secret     = consumer_secret
      config.access_token        = access_token
      config.access_token_secret = access_token_secret
    end

    index
    flash[:notice] = 'successfully saved.'
    # render 'index'
    redirect_to '/'

  end

  def retweet
  end
end
