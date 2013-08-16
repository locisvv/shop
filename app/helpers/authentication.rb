helpers  do
    def login_required
		unless session[:user]
			flash[:error] = @@errors[:login_required]
			redirect '/login'
		end	
    end

    def site_admin!
		unless session[:user] or session[:user].permission
			flash[:error] = @@errors[:sign_in_admin]
			redirect '/'
		end		
	end		
end