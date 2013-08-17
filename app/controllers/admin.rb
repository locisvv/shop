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
	
	photo_file = params[:img][:tempfile]
	photo_name = params[:img][:filename]
	
	if group.valid?
		group.save

		if photo_file and photo_name
			photo = Photo.new()
			photo.group_id = group.id
			photo.save

			new_photo_name = photo.id.to_s + photo_name

			photo.name = new_photo_name

			upload_photo(photo_file, new_photo_name)
			
			photo.save
		end
	else
		flash[:error] = @@errors[:incorrect_product]
	end
end

get '/admin/group/:id' do
	@group = Group.get(params[:id])
	
	
	if @group
		erb :edit_group
	else
		flash[:error] = "404" 
	end
		
end

post '/admin/new_product' do
	group = Group.first(:name => params[:product][:group_name])

	if group
		product = Product.new(
			:name => params[:product][:name],
			:price => params[:product][:price],
			:description => params[:product][:description],
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
end

post '/admin/update_product' do
	
end
