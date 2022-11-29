class IndexController < ApplicationController
  def index
    @config = {
      twitter_consumer_key: cookies[:twitter_consumer_key],
      twitter_consumer_secret: cookies[:twitter_consumer_secret],
      twitter_access_token: cookies[:twitter_access_token],
      twitter_access_token_secret: cookies[:twitter_access_token_secret]
    }
    @videos = []
    @videos = ['a', 'b']
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

    index
    flash[:notice] = 'successfully saved.'
    # render 'index'
    redirect_to '/'

  end

  def retweet
  end


  private
  def twitter_client
    @client ||= Twitter::REST::Client.new do |config|
      twitter_config = Rails.application.credentials.config
      # 如果没有提供，则使用系统设置的
      config.consumer_key        = cookies[:twitter_consumer_key] || twitter_config[:twitter_consumer_key]
      config.consumer_secret     = cookies[:twitter_consumer_secret] || twitter_config[:twittet_consumer_secret]
      config.access_token        = cookies[:twitter_access_token]
      config.access_token_secret = cookies[:twitter_access_token_secret]
    end
  end
end
