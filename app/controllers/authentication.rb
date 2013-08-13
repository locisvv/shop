# encoding: utf-8
get '/sign_up' do
	if session[:user]
		session[:error] = @@errors[:registered]
	else
		erb :sign_up
	end	
end

post '/sign_up' do
	user = params[:user]

	if session[:user]
		session[:error] = @@errors[:registered]
		redirect back
	elsif user[:firstname].empty? or
		  user[:lastname].empty?  or
		  user[:email].empty? 	  or
		  user[:login].empty? 	  or
		  user[:password].empty?

		session[:error] = @@errors[:empty_input]
		redirect '/sign_up'
	end	
	
	found_user = User.first(:login => user[:login])
 
	if found_user
		session[error] = @@errors[:sign_up]
		redirect '/sign_up'
	else
		new_user = User.create(user)
		new_user.save
	end

	redirect '/'
end

get '/login' do
	if session[:user]
		@@errors[:logged_in]
		redirect '/'
	else
		erb :login
	end
end

post '/login' do
	user = params[:user]
	if user[:login].empty? or user[:password].empty?
		session[:error] = @@errors[:empty_input]
		redirect back
	end

	found_user = User.first(:login => user[:login], :password => user[:password])

	if found_user
		session[:user] = found_user
	else
		session[:error] = @@errors[:login]
	end

	redirect '/'
end

get '/logout' do
	session[:user] = nil
end
