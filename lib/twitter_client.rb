twitter_config = Rails.application.credentials.config
TwitterClient = Twitter::REST::Client.new do |config|
  config.consumer_key        = twitter_config[:twitter_consumer_key]
  config.consumer_secret     = twitter_config[:twitter_consumer_secret]
  config.access_token        = twitter_config[:twitter_access_token]
  config.access_token_secret = twitter_config[:twitter_access_token_secret]
end
