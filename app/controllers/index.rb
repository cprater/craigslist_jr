get '/' do
  @posts = Post.all
  erb :index
end

get '/login' do
  erb :login
end

get '/logout' do
  session[:current_user] = nil
  redirect '/'
end

get '/create_post' do
  erb :create_post
end

get '/post/:post_id' do
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

  if user.save
    session[:current_user] = user.id
    redirect '/'
  else
    @name_error = true
    erb :login
  end
end

post '/create_post' do
  post = Post.new(params[:post])

  if post.save
    redirect "/post/#{post.id}"
  else
    @no_title = true
    erb :create_post
  end
end

post '/post/:post_id/add_comment' do
  comment = Comment.new(user_id: session[:current_user],post_id: params[:post_id], content: params[:content])

  if comment.save
    redirect '/post/params[:post_id]'
  end
end

























