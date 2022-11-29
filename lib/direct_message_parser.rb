class DirectMessageParser
  def initialize(events)
    @events = events
  end

  def videos
    videos = @events.attrs[:events].map{|event| event[:message_create][:message_data][:attachment].try(:[], :media).try(:[], :video_info)}.compact
=begin
    [{:aspect_ratio=>[16, 9],
      :duration_millis=>18087,
      :variants=>
       [{:bitrate=>256000, :content_type=>"video/mp4", :url=>"https://video.twimg.com/dm_video/1597535491616014338/vid/320x180/reb3-U842brZfaU6ignRj5QoU2jdVvq04RqLUFu_nMg.mp4?tag=1"},
        {:bitrate=>2176000, :content_type=>"video/mp4", :url=>"https://video.twimg.com/dm_video/1597535491616014338/vid/1280x720/Bq7Qu5YlIa8CHCBb8QMh4Qw4GcDCNRIGH4724ngQ2tA.mp4?tag=1"},
        {:content_type=>"application/x-mpegURL", :url=>"https://video.twimg.com/dm_video/1597535491616014338/pl/eI5qefVZ90Zl1iYknp7nVAriKinFg915sOMuaAvYjaY.m3u8?tag=1&container=fmp4"},
        {:bitrate=>832000, :content_type=>"video/mp4", :url=>"https://video.twimg.com/dm_video/1597535491616014338/vid/640x360/mPSXdR6kWbHLYyEsqJCJ4CgLocrEF4JRKjvM_7hc7UU.mp4?tag=1"}]}]
=end
  end

  def video_urls
    # 获取最高分辨率的 url
    videos.map{|video|
      video_url = video[:variants].sort_by{|v|
        v[:bitrate] || 0
      }.reverse.first[:url]
      video_url
    }
  end
end