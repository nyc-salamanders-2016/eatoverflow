get '/questions' do
  @questions = Question.all
  erb :'questions/index'
end

get '/questions/new' do
  erb :'questions/new'
end

post '/questions' do
    @question = Question.new(params[:question])
  if @question.save
    tag_array = params[:tags].split(' ')
    create_tags(tag_array)
    redirect '/questions'
  else
    @errors = question.errors.full_messages
    erb :'questions/new'
  end
end

get '/questions/:id' do
  @question = Question.find(params[:id])
  @answers = @question.answers
  @score = @question.votes.reduce(0) { |score, vote| score += vote.value }
  erb :'questions/show'
end

get '/questions/:id/comments' do
  @question = Question.find(params[:id])
  erb :'questions/_new_comment_form'
end

post '/questions/:id/comments' do
  @question = Question.find(params[:id])
  comment = @question.comments.new(params[:comment])
  if comment.save
    redirect "/questions/#{@question.id}"
  else
    @errors = comment.errors.full_messages
    erb :'_new_comment_form'
  end
end
