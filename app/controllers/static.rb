get '/' do
  erb :"static/index"
end

post '/create_url' do
	@url = Url.create_url(params[:long_url])
  	erb :"static/index"
end

get '/:short_url' do
	@url = Url.find_by(short_url: params[:short_url])
	if @url
	@url.click_count +=1
		redirect 'https://' + Url.find_by(short_url: params[:short_url]).long_url
	end
end