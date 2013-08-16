class Photo
  	include DataMapper::Resource

	property :id,    	  Serial
	property :name,  	  String
	property :created_at, Integer, :default => Time.now.to_i

  	belongs_to :product, :group
end  	