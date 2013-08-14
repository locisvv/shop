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

	# def presence_user
	# 	found_user = self.first(:login => self.login, :password => self.password)
	# 	found_user ? true : false
	# end

	#  validates_with_method :presence_user, :when => [:presence_user]
end