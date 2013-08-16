helpers  do
	def upload_photo(file, file_name)
		image = MiniMagick::Image.read(file)
		image.resize "400x400"
		image.write("./public/photos/#{file_name}")
	end
end