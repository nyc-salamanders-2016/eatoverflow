
get '/answers' do
  @answers = Answer.all
  erb :'answers/index'
end

get '/answers/new' do

  ## add authentication


  erb :'answers/new'
end

post '/answers' do
  @answer = Answer.new(params[:answer])

  ## add authentication
  ## add user id to params

  if @answer.save
    redirect '/answers'
  else
    erb :'answers/new'
  end
end

get '/answers/:id' do
  @answer = Answer.find(params[:id])
  erb :'answers/show'
end

get '/answers/:id/edit' do
  @answer = Answer.find(params[:id])
  erb :'answers/edit'

  ## add authentication

end

put '/answers/:id' do
  @answer = Answer.find(params[:id]) #
  @answer.assign_attributes(params[:answer])
  if @answer.save
    redirect '/answers'
  else
    erb :'answers/edit'
  end
end

delete '/answers/:id' do
  @answer = Answer.find(params[:id])
  @answer.destroy
  redirect '/answers'
end