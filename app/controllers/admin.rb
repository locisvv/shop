before '/admin/*' do
  	site_admin!
end

get '/admin/edit' do
	@groups = Group.all
	@products = Product.all
	erb :admin
end

post '/admin/new_group' do
	group = Group.new(params[:group])
	
	if group.valid?
		group.save

		if params[:img]
			photo = Photo.new(group_id: group.id)
			photo.save

			upload_photo(params[:img], photo)
		end
	else
		flash[:error] = @@errors[:incorrect_value]
	end

	redirect back
end

get '/admin/group/:id' do
	@group = Group.get(params[:id])
	
	if @group
		erb :edit_group
	else
		flash[:error] = "404" 
	end
		
end

post '/admin/group_edit' do
	group = Group.get(params[:id])

	name = params[:name]
	description = params[:description]
	
	if group and name and description
		group.update(name: name, description: description)

		if params[:img]
			photo = Photo.new(group_id: group.id)
			photo.save

			upload_photo(params[:img], photo)
		end	
	else
		flash[:error] = @@errors[:incorrect_value]
	end

	redirect back
end	

post '/admin/new_product' do
	group = Group.first(:name => params[:group_name])

	if group
		product = Product.new(
			:name => params[:name],
			:price => params[:price],
			:description => params[:description],
			:group_id => group.id
		)
		if product.valid?
			product.save
		else
			flash[:error] = @@errors[:incorrect_product]
		end
	else
		flash[:error] = @@errors[:incorrect_product]
	end

	redirect back
end

post '/admin/update_product' do
	
end
