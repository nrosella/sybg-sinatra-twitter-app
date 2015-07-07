class TwitterController < ApplicationController

	get '/' do
	  # first we need to instantiate a new instance of our GetTweets class
	  connection = GetTweets.new("ninorosella")
	  
	  # we're calling the get_search_results method on that instance and assigning it to an instance variable. 
	  @timeline = connection.display_timeline
	  # binding.pry
	  @other = connection.display_images
	  # binding.pry
	  erb :'tweets/tweets'
    end

	post '/tweets' do

	  
	  time_hours = params[:hour].to_i
	  
	  connection = GetTweetsByHour.new("ninorosella", time_hours)
	  @back = connection.roll_back_time
	  # binding.pry

	  erb :'/tweets/new_tweets'

	end

end