get '/questions' do
  @questions = Question.all
  erb :'questions/index'
end

get '/questions/new' do
  erb :'questions/new'
end

post '/questions' do
    question = Question.new(params[:question])
  if question.save
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
  erb :'questions/show'
end
