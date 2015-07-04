class TwitterController < ApplicationController

get '/tweets' do
    # first we need to instantiate a new instance of our GetTweets class
    connection = GetTweets.new("ninorosella")

    # we're calling the get_search_results method on that instance and assigning it to an instance variable. 
    @timeline = connection.display_timeline

    erb :'tweets/tweets'
	end


end