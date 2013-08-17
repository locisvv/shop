class Product
  	include DataMapper::Resource

  	property :id, Serial
  	property :name, String
  	property :price, Float
  	property :description, Text
  	property :created_at, Integer, :default => Time.now.to_i

  	belongs_to :group
  	has n, :photo
end