require 'bundler'
Bundler.require()


#============================================ CONNECTION
ActiveRecord::Base.establish_connection(
	:adapter => 'postgresql',
	:database => 'all_the_bands'
)


#============================================ MODELS
require './models/band'
require './models/genre'


#============================================ ROUTES

#===========Genre Routes

get '/api/genres' do 

	content_type :json
	Genre.all.to_json

end

get '/api/genres/:id' do 

	content_type :json
	id = params[:id].to_i
	Genre.find(id).to_json

end

post '/api/genres' do 

	content_type :json
	genre = Genre.create(params[:genre])
	genre.to_json

end

put '/api/genres/:id' do 

	content_type :json
	id = params[:id]
	genre = Genre.find(id)
	genre.update(params[:genre])
	genre.to_json

end

patch '/api/genres/:id' do 

	content_type :json
	id = params[:id]
	genre = Genre.find(id)
	genre.update(params[:genre])
	genre.to_json

end

delete '/api/genres/:id' do 

	content_type :json
	id = params[:id].to_i
	Genre.destroy(id)
	{message: 'Great Successs'}.to_json

end


#===========Band Routes

get '/api/genres/:genre_id/bands' do 

	content_type :json
	id = params[:genre_id].to_i
	genre = Genre.find(id)
	genre.bands.to_json

end

get '/api/genres/:genre_id/bands/:id' do 

	content_type :json
	id = params[:genre_id].to_i
	genre = Genre.find(id)
	genre.Band.find(params[:id]).to_json

end

post '/api/genres/:genre_id/bands' do 

	content_type :json
	id = params[:genre_id].to_i
	genre = Genre.find(id)
	band = Band.create(params[:band])
	genre.bands << band
	band.to_json

end

put '/api/genres/:genre_id/bands/:id' do 

	content_type :json
	id = params[:genre_id].to_i
	genre = Genre.find(id)
	band = genre.Band.find(params[:id].to_i)
	band.update(params[:band]).to_json

end

patch '/api/genres/:genre_id/bands/:id' do 

	content_type :json
	id = params[:genre_id].to_i
	genre = Genre.find(id)
	band = genre.Band.find(params[:id].to_i)
	band.update(params[:band]).to_json

end

delete '/api/genres/:genre_id/bands/:id' do 

	content_type :json
	id = params[:genre_id].to_i
	genre = Genre.find(id)
	band = genre.Band.find(params[:id].to_i)
	band.delete
	{message: 'Great Successs'}.to_json

end









