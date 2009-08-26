require "rubygems"
require "httparty"
#require "mash"

class Ribbit
	include HTTParty
	attr_accessor :username, :api_key
	
	base_uri "http://api.bit.ly"
	format :json
	
	def initialize(username, api_key)
		@username = username
		@api_key = api_key
		self.class.default_params :version => "2.0.1", :login => @username, :apiKey => @api_key
	end
	
	def shorten(long_url)
		self.class.get("/shorten", :query => {:longUrl => long_url})
	end
	
	def expand(short_url)
		options = short_url =~ /^http:\/\// ? {:shortUrl => short_url} : {:hash => short_url}
		self.class.get("/expand", :query => options)
	end
	
	def info(short_url)
		options = short_url =~ /^http:\/\// ? {:shortUrl => short_url} : {:hash => short_url}
		self.class.get("/info", :query => options)
	end
	
	def stats(short_url)
		options = short_url =~ /^http:\/\// ? {:shortUrl => short_url} : {:hash => short_url}
		self.class.get("/stats", :query => options)
	end
	
end