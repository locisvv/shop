get '/' do
	erb :home
end

get '/index' do
	erb :index
end

get '/group/:id' do
	@group = Group.get(params[:id])
	
	if @group
		@product = @group.product
		erb :group
	else
		flash[:error] = @@errors[:empty_group]
	end	
end	