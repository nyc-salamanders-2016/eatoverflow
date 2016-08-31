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

get 'users/login' do

end

post 'users/login' do

end

get 'users/logout' do
  session.delete(:user_id)
  redirect '/'
end