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
	else
		flash[:error] = @@errors[:incorrect_product]
	end
end

post '/admin/update_group' do
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
