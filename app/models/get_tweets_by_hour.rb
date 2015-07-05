class GetTweetsByHour
  attr_reader :handle
  attr_accessor :hours

  def initialize(handle, hours)
    @handle = handle
    @hours = hours
  end

  TWITTER = Twitter::REST::Client.new do |config|
    
    config.consumer_key = "TpMbnJSKy3Dtws06GQF33XniL"
    config.consumer_secret = "txDn3fHwmbpyjTGVd6xy1qTe1iQetJrGrtJ7V0E5ODIhshO8DQ"
    config.access_token = "338465511-w382CevTb1wdUo8RTGt0HsGrOCQtBlqYTfMJeAMw"
    config.access_token_secret = "XSQKNN50anJvOb60OwqpGORBLuyUf7uHsnRwS7PjO9Ddc"
  end

  def roll_back_time
    timeline_search_results = []
    hours_converted = hours * 60 * 60
    time = Time.now - hours_converted
    time_plus_two = time + 7200
    
    TWITTER.home_timeline(:count => 200).each do |tweet|
      if tweet.created_at > time 
        timeline_search_results << [tweet.user.name, tweet.text]
      end
    end
    timeline_search_results
  end

end
