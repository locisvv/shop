class User
  include DataMapper::Resource
	property :id,         	Serial
	
	property :firstname,   String
	property :lastname,    String
	property :email,	   String	
	property :login,       String
	property :password,    String
end