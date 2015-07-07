class GetTweets
  attr_reader :handle

  def initialize(handle)
    @handle = handle
  end

  TWITTER = Twitter::REST::Client.new do |config|
    
    config.consumer_key = "TpMbnJSKy3Dtws06GQF33XniL"
    config.consumer_secret = "txDn3fHwmbpyjTGVd6xy1qTe1iQetJrGrtJ7V0E5ODIhshO8DQ"
    config.access_token = "338465511-w382CevTb1wdUo8RTGt0HsGrOCQtBlqYTfMJeAMw"
    config.access_token_secret = "XSQKNN50anJvOb60OwqpGORBLuyUf7uHsnRwS7PjO9Ddc"
  end

  # def get_search_results
  #   twitter_search_results = []
  #   TWITTER.search(handle).each do |tweet|
  #     twitter_search_results << [tweet.user.name, tweet.text]
  #   end
  #   twitter_search_results
  # end

  def display_timeline
    timeline_search_results = []
    TWITTER.home_timeline.each do |tweet|
      timeline_search_results << [tweet.user.name, tweet.text]
      # binding.pry
    end
    timeline_search_results
  end

  def display_images
    timeline_images = []
    TWITTER.home_timeline.each do |tweet|
      # binding.pry
      if tweet.attrs[:entities][:media] != nil && tweet.attrs[:entities][:media].first[:type].include?("photo")
        timeline_images << tweet.attrs[:entities][:media].first[:media_url]
      end
      
    end
    timeline_images
  end

end
