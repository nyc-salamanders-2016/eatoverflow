
get '/answers' do
  @answers = Answer.all
  erb :'answers/index'
end

get '/answers/new' do

  ## add authentication

  erb :'answers/new'
end

post '/answers' do
  @answer = Answer.new(params[:answer].merge({ "user_id" => current_user.id }))
  ## add authentication

  if @answer.save
    redirect "/questions/#{params[:answer][:question_id]}"
  else
    erb :'answers/new'
  end
end

get '/answers/:id/comments' do

  @answer = Answer.find(params[:id])

  erb :'answers/_new_comment_form'
end

post '/answers/:id/comments' do
  @answer = Answer.find(params[:id])
  comment = @answer.comments.new(params[:comment])
  if comment.save
    redirect "/questions/#{@answer.question_id}"
  else
    @errors = comment.errors.full_messages
    erb :'answers/_new_comment_form'
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
    redirect "/questions/#{@answer.question_id}"
  else
    erb :'answers/edit'
  end
end

delete '/answers/:id' do
  @answer = Answer.find(params[:id])
  @answer.destroy
  redirect "/questions/#{@answer.question_id}"
end
