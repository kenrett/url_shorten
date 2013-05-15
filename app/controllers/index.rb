# SecureRandom was required in config/database so we don't have to require it here

get '/' do
  # Look in app/views/index.erb
  erb :index
end

get '/' do
  # let user create new short URL, display a list of shortened URLs
end

post '/urls' do
  # create a new Url
end

# e.g., /q6bda
get '/:short_url' do
  @url = Url.find_by_short_url(params[:short_url])
  @url.increment
  redirect to "http://#{@url.long_url}"
end

post '/shorten' do
 @url = Url.new(:short_url => SecureRandom.hex(3), :long_url => params[:url].gsub(/^http:\/\//,''))
 @url.save 
  if @url.save
    erb :shorten
  else 
    @errors = @url.errors
    erb :index
  end
end 


