get '/users/new' do
  erb :'users/new'
end

post '/users' do
  user = User.new(params[:user])
  if user.save
    session[:user_id] = user.id
    redirect '/'
  else
    @errors = user.errors.full_messages
    erb :'users/new'
  end
end

get '/users/login' do
  erb :'users/login'
end

post '/users/login' do
  user = User.find_by(username: params[:username])
  if user.authenticate(params[:password])
    session[:user_id] = user.id
    redirect '/'
  else
    @error = "Invalid username or password"
    erb :'users/login'
  end
end

get '/users/logout' do
  session.clear
  redirect '/'
end

get '/users/:id' do
  logged_in?
  @user = User.find(params[:id])
  @user_questions = @user.questions
  @user_answers = @user.answers
  @recent_likes = @user.votes.where(value: 1).last(5)
  # @liked_posts =[].reverse
  @liked_posts = @user.sort_likes(@recent_likes)
  erb :'users/show'
end
