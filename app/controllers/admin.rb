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
			new_photo_name = group.id.to_s + 'g' + photo_name

			upload_photo(photo_file, new_photo_name)

			group.photo_name = new_photo_name
			group.save
		end
	else
		flash[:error] = @@errors[:incorrect_product]
	end
end

get '/admin/edit_group' do
	erb :edit_group
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
