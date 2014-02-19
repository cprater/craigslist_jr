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
  # binding.pry
  @category = Category.find(params[:category_id])
  erb :create_post
end

get '/:category_id/:post_id' do
  @post = Post.find(params[:post_id])
  erb :post
end

get '/:category_id/:post_id/:pin' do
  erb :edit_post
end

get '/categories/new' do
end

post '/new_category' do
  Category.create(name: params[:name])
  redirect to '/'
end

post '/:category_id/new' do
  p params[:category_id]
  # @pin_number = rand(00..99)
  # Post.create(title: params[:title], content: params[:content], category_id: params[:category_id])
  # Post.create(title: params[:post_title], content: params[:post_content])
  erb :index
  # @edit_page_url = "localhost:9393/#{new_post.category_id}/#{new_post.id}/#{new_post.pin}"
  # binding.pry
  # @category = Category.find(params[:category_id])
  # @category.posts << Post.new(params[:post])
  # erb :post_confirmation
end




# get '/categories/:category_id/posts/new' do
#   @category = Category.find(params[:category_id])
#   erb :new_post
# end

# post '/categories/:category_id/posts' do
#   puts params.inspect
#   @category = Category.find(params[:category_id])
#   @category.posts << Post.new(params[:post])
#   # redirect to categories/id page
#   200
# end

# post '/categories' do
# end

