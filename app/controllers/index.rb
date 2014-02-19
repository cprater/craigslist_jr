get '/' do
  #list all posts in category w/ catg
  erb :index
end

get '/new_category' do
  erb :new_category
end

get '/:category_id' do
  @category_id = params[:category_id]
  @posts = Post.where(category_id: params[:category_id])
  erb :list_posts
end

get '/:category_id/new' do  
  @id = params[:category_id]
  @category = Category.find(params[:category_id])
  erb :create_post
end

get '/:post_id/edit' do
  @post = Post.find(params[:post_id])
  erb :edit_post
end

get '/:category_id/:post_id' do
  @post = Post.find(params[:post_id])
  erb :post
end

get '/categories/new' do
end

post '/posts' do
  Post.create(params[:post])
  erb :index
end

post '/new_category' do
  Category.create(name: params[:name])
  redirect to '/'
end

post '/post/edit' do 
  @post = Post.find(params[:post_id])
  @post.update_attributes(content: params[:content])
  erb :post
end

