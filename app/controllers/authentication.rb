# encoding: utf-8
get '/sign_up' do
	if session[:user]
		flash[:error] = @@errors[:registered]
	else
		erb :sign_up
	end	
end

post '/sign_up' do
	
	if session[:user]
		flash[:error] = @@errors[:registered]
		redirect back
	end

	user = User.create(params[:user])

	if user.valid?
		user.save
		redirect '/'
	else
		flash[:error] = user.errors.collect do |k,v|
        	"#{k} #{v}"
      	end.join(' ')

		redirect '/sign_up'
	end
end

get '/login' do
	if session[:user]
		flash[:error] = @@errors[:logged_in]
		redirect '/'
	else
		erb :login
	end
end

post '/login' do
	user = params[:user]
	if user[:login].empty? or user[:password].empty?
		flash[:error] = @@errors[:empty_input]
		redirect back
	end

	found_user = User.first(:login => user[:login], :password => user[:password])

	if found_user
		session[:user] = found_user
		redirect '/'
	else
		flash[:error] = @@errors[:login]
		redirect back
	end
end

get '/logout' do
	session[:user] = nil
	flash[:notice] = @@notice[:logout]
	redirect '/'
end

get '/my_page' do
	login_required

	erb :my_page
end