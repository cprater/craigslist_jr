get '/' do
  @posts = Post.find(:all, :order => "votes desc", :limit => 10)
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

get '/profile/:user_id' do
  @user = User.find(params[:user_id])
  if !@user
    @no_user
  end

 erb :profile
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
  user = User.find(session[:current_user])
  post = Post.new(params[:post])

  if post.valid?
    user.posts << post
    redirect "/post/#{post.id}"
  else
    @no_title = true
    erb :create_post
  end
end

post '/user_comments' do
  if request.xhr?
    @comments = User.find(params[:user_id]).comments.all
    erb :_user_comments, layout: false
  else
    erb :index
  end
end


post '/user_posts' do
  if request.xhr?
    @posts = User.find(params[:user_id]).posts.all
    erb :_user_posts, layout: false
  else
    erb :index
  end
end

post '/post/up_vote' do
  content_type :json
  post = Post.find(params[:post_id])
  vote = (post.votes += 1)
  post.save
  vote.to_json
end

post '/post/vote_down' do 
  # binding.pry
  content_type :json
  post = Post.find(params[:post_id])
  vote = (post.votes -= 1)
  post.save
  vote.to_json
end

post '/post/:post_id/add_comment' do
  comment = Comment.create(user_id: session[:current_user], post_id: params[:post_id], content: params[:content])
  redirect "/post/#{params[:post_id]}"
end

























