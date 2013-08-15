class User
  	include DataMapper::Resource

	property :id, Serial
	property :firstname, String, :length => (3..40), :messages => {:length => @@errors[:length]}
	property :lastname,  String, :length => (3..40), :messages => {:length => @@errors[:length]}
	
	property :email,     String, :length => (5..40), :unique => true, :format => :email_address,
			 :messages => {
		      	:is_unique => @@errors[:unique_email],
		      	:format    => @@errors[:incorrect_email]
			 }
	property :login,     String, :length => (3..40), :unique => true,
			 :messages => {
			 	:length => @@errors[:length],
			 	:is_unique => @@errors[:unique_login]
			 }

	property :password,  String, :length => (6..40), :messages => {:length => @@errors[:length_password]}
	property :permission, Boolean, :default => false

end