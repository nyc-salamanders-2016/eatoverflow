post '/answers/new' do
  # binding.pry
  @question = Question.find(params[:question_id])
    if request.xhr?
      erb :'answers/_new_answer_form', locals: {question: @question}, layout: false
    else
      erb :'answers/new'
    end
    # erb :'answers/new'
end

post '/answers' do
  @answer = Answer.new(params[:answer])
  # binding.pry
  if @answer.save
    if request.xhr?
      erb :'answers/_display_answer', locals: {answer: @answer }, layout: false
    else
    redirect "/questions/#{@answer.question_id}"
    end
  else
    erb :'answers/new'
  end
end

get '/answers/:id/comments' do
  @answer = Answer.find(params[:id])
  if request.xhr?
    erb :'/answers/_new_comment_form', layout: false
  else
    erb :'answers/_new_comment_form'
  end
end

post '/answers/:id/comments' do
  @answer = Answer.find(params[:id])
  @comment = @answer.comments.new(params[:comment])
  if @comment.save
    if request.xhr?
      erb :'/answers/_new_comment_show', locals: {comment: @comment}, layout: false
    else
      redirect "/questions/#{@answer.question_id}"
    end
  else
    @errors = comment.errors.full_messages
    erb :'answers/_new_comment_form'
  end
  # p "something"
end

get '/answers/:id' do
  @answer = Answer.find(params[:id])
  erb :'answers/show'
end

get '/answers/:id/edit' do
  if logged_in?
    @answer = Answer.find(params[:id])
    erb :'answers/edit'
  else
    erb :'404'
  end
end

put '/answers/:id' do
  @answer = Answer.find(params[:id])
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

put '/answers/:id/bestanswer' do

  @answer = Answer.find(params[:id])

  # @question = Question.find(params[:question_id])
  @answer.best_answer = true

  unless @answer.best_answer_finder
    if @answer.save
      redirect "/questions/#{@answer.question_id}"
    else
      erb :'404'  # needs better route and error handling
    end
  else
    erb :'404'
  end
end

