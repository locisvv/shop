class Group
  	include DataMapper::Resource

  	property :id, Serial
  	property :name, String 
  	property :description, Text
  	property :created_at, Integer, :default => Time.now.to_i
  	
  	has n, :product
  	has n, :photo
end  	