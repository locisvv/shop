class Group
  	include DataMapper::Resource

  	property :id, Serial
  	property :name, String 
  	property :description, Text

  	has n, :product
end  	