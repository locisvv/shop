helpers  do
    def login_required
		unless session[:user]
			flash[:error] = @@errors[:login_required]
			redirect '/login'
		end	
    end
end