get '/' do
  @posts = Post.all
  erb :index
end

get '/login' do
  erb :login
end

get '/:post_id' do
  @post = Post.find(params[:post_id])
  erb :post
end


#POST ===============================================================

post '/login' do
  user = User.find_by_user_name(params[:user_name])
  if user == nil
    @no_user = true
  elsif user.authenticate(params[:password])
    session[:current_user] = user.id
    redirect '/'
  else
    @no_password = true
  end
  erb :login
end

post '/create_user' do
  user = User.new(params[:user])

  if


end


