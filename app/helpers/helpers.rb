helpers  do
	def upload_photo(file, photo)
		photo_file = file[:tempfile]
		photo_name = file[:filename]

		photo.name = photo.id.to_s + photo_name
		photo.save

		image = MiniMagick::Image.read(photo_file)
		image.resize "400x400"
		image.write("./public/photos/#{photo.name}")
	end
end