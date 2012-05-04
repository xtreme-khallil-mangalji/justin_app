class Tweet < ActiveRecord::Base

	attr_accessible :image_url, :text, :title

 	def self.refresh
	  	require 'json'
		require 'net/http'
		url = "http://search.twitter.com/search.json?q=@JustinBieber&rpp=10&include_entities=true&result_type=mixed"
		resp = Net::HTTP.get_response(URI.parse(url))
		data = resp.body
		result = JSON.parse(data)

		if result.has_key? 'Error'
			raise "twitter error"
		end

		@j_tweets = result["results"]

	  	@j_tweets.each do |tweet| 
			tweet = Tweet.create(image_url: tweet["profile_image_url"], text: tweet["text"],title: tweet["from_user"])
		end
 	end
end
