require 'test_helper'

class RibbitTest < Test::Unit::TestCase
  
	context "an instance of Ribbit" do
		
		setup do
			@auth = YAML.load_file(File.join(File.dirname(__FILE__), "auth.yml"))
			@ribbit = Ribbit.new(@auth["user"], @auth["api_key"])
		end
		
		
	end

end
