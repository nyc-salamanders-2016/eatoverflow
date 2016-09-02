get '/questions' do
  @questions = Question.order(created_at: :asc)
  erb :'questions/index'
end

get '/questions/new' do
  if logged_in?
    erb :'questions/new'
  else
    erb :'404'
  end
end

post '/questions' do
    @question = Question.new(params[:question])
  if @question.save
    tag_array = params[:tags].split(' ')
    create_tags(tag_array)
    redirect '/questions'
  else
    @errors = @question.errors.full_messages
    erb :'questions/new'
  end
end

get '/questions/:id' do
  @question = Question.find(params[:id])
  @answers = @question.answers.order(best_answer: :desc, created_at: :desc)
  # HOW TO ORDER BY SCORE? I.E., get_score(question)
  @score = get_score(@question)
  erb :'questions/show'
end

get '/questions/:id/comments' do
  if logged_in?
    @question = Question.find(params[:id])
    if request.xhr?
      erb :'/questions/_new_comment_form', layout: false
    else
      erb :'/questions/_new_comment_form'
    end
  else
    erb :'404'
  end
end

post '/questions/:id/comments' do
  @question = Question.find(params[:id])
  @comment = @question.comments.new(params[:comment])
  if @comment.save
    if request.xhr?
      erb :'/questions/_new_comment_show', locals: {comment: @comment}, layout: false
    else
    redirect "/questions/#{@question.id}"
    end
  else
    @errors = comment.errors.full_messages
    erb :'/questions/_new_comment_form'
  end
end

post '/questions/:id/answers/new' do
  @question = Question.find(params[:id])
  @answer = @question.answers.new(params[:answer])
  if @answer.save
    if request.xhr?
      erb :'answers/_display_answer', locals: {answer: @answer }, layout: false
    else
    redirect "/questions/#{@question.id}"
    end
  else
    erb :'answers/new'
  end
end

get '/questions/:id/edit' do
  @question = Question.find(params[:id] 
  if logged_in? && @question.user_id == current_user.id
    erb :'questions/edit'
  else
    erb :'404'
  end
end

put '/questions/:id' do
  @question = Question.find(params[:id]) #
  @question.assign_attributes(params[:question])
  if @question.save
    redirect "/questions/#{@question.id}"
  else
    erb :'questions/edit'
  end
end

delete '/questions/:id' do
  @question = Question.find(params[:id])
  @question.destroy
  redirect "/questions"
end
