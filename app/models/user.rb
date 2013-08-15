class User
  include DataMapper::Resource
	property :id, Serial
	
	property :firstname, String
	property :lastname, String
	property :email, String, 
			 :length => (5..40),
			 :unique => true,
			 :format => :email_address,
			 :messages => {
		      	:is_unique => @@errors[:unique_email],
		      	:format    => @@errors[:incorrect_email]
			 }
	property :login, String, 
			 :unique => true,
			 :messages => {
			 	:is_unique => @@errors[:unique_login]
			 }

	property :password, String
end