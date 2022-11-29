class IndexController < ApplicationController
  def index
    @config = {
      twitter_consumer_key: cookies[:twitter_consumer_key],
      twitter_consumer_secret: cookies[:twitter_consumer_secret],
      twitter_access_token: cookies[:twitter_access_token],
      twitter_access_token_secret: cookies[:twitter_access_token_secret]
    }
    @videos = []
    begin
      events = twitter_client.direct_messages_events
      @videos = DirectMessageParser.new(events).video_urls
    rescue Exception => e
      flash.now[:notice] = "获取视频失败: #{e.message}"
    end
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

    begin
      user = twitter_client.user('aotianlong')
      flash[:notice] = 'successfully saved.'
      cookies[:valid_settings] = true
    rescue Exception => e
      cookies[:valid_settings] = false
      flash[:error] = e.message
    end
    index
    # render 'index'
    redirect_to '/'

  end

  def retweet
    video_url = params[:video_url]
    text = params[:text] || '转发'
    # 下载视频
    temp_file = "#{Rails.root.join('tmp', Time.now.to_f.to_s)}.mp4"
    begin
      # 为了安全起见，检查video_url格式是否正确
      if video_url =~ /^https?:\/\//
        twitter_client = TwitterClient
        `wget #{video_url} -O #{temp_file}`
        tweet = twitter_client.update_with_media(text, File.new(temp_file))
        # tweet = twitter_client.update("I'm tweeting with @gem!")
        # 重定向到新发布的推
        redirect_to tweet.url.to_s, allow_other_host: true
      else
        raise 'invalid video url'
      end
    rescue Exception => e
      flash[:error] = e.message
      redirect_to '/'
    end
  end


  private
  def twitter_client
    @client ||= Twitter::REST::Client.new do |config|
      twitter_config = Rails.application.credentials.config
      # 如果没有提供，则使用系统设置的
      config.consumer_key        = cookies[:twitter_consumer_key].presence || twitter_config[:twitter_consumer_key]
      config.consumer_secret     = cookies[:twitter_consumer_secret].presence || twitter_config[:twittet_consumer_secret]
      config.access_token        = cookies[:twitter_access_token]
      config.access_token_secret = cookies[:twitter_access_token_secret]
    end
  end
end
