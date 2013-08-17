class Photo
  	include DataMapper::Resource

	property :id,    	  Serial
	property :name,  	  String
	property :created_at, Integer, default: Time.now.to_i
	
	property :product_id, Integer, index: true
	property :group_id,   Integer, index: true

  	# belongs_to :product
  	# belongs_to :group
end  	