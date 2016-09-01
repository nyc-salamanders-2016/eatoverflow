post '/questions/:id/upvote' do
  @question = Question.find(params[:id])
  @answers = @question.answers
  @vote = @question.votes.new(value: 1, user_id: current_user.id )
  if @vote.save
    @score = get_score(@question)
    if request.xhr?
      erb :'_score', layout: false, locals: { :score => @score}
    else
      redirect "/questions/#{@question.id}"
    end
  else
    @errors = @vote.errors.full_messages
    if request.xhr?
      erb :'questions/_errors', layout: false, locals: { errors: @errors }
    else
      erb :"questions/show"
    end
  end
end

post '/questions/:id/downvote' do
  @question = Question.find(params[:id])
  @answers = @question.answers
  @vote = @question.votes.new(value: -1, user_id: current_user.id )
  if @vote.save
    @score = get_score(@question) 
    if request.xhr?
      erb :'_score', layout: false, locals: { :score => @score}
    else
      redirect "/questions/#{@question.id}"
    end
  else
    @errors = @vote.errors.full_messages
    if request.xhr?
      erb :'questions/_errors', layout: false, locals: { errors: @errors }
    else
      erb :"questions/show"
    end
  end
end

post '/answers/:id/upvote' do
  answer = Answer.find(params[:id])
  @question = answer.question
  @answers = @question.answers
  @vote = answer.votes.new(value: 1, user_id: current_user.id )
  if @vote.save
    @score = get_score(answer) 
    if request.xhr?
      erb :'_score', layout: false, locals: { :score => @score}
    else
      redirect "/questions/#{@question.id}"
    end
  else
    @ans_errors = @vote.errors.full_messages
    if request.xhr?
      erb :'questions/_errors', layout: false, locals: { errors: @ans_errors }
    else
      erb :"questions/show"
    end
  end
end


post '/answers/:id/downvote' do
  answer = Answer.find(params[:id])
  @question = answer.question
  @answers = @question.answers
  @vote = answer.votes.new(value: -1, user_id: current_user.id )
  if @vote.save
    @score = get_score(answer) 
    if request.xhr?
      erb :'_score', layout: false, locals: { :score => @score}
    else
      redirect "/questions/#{@question.id}"
    end
  else
    @ans_errors = @vote.errors.full_messages
    if request.xhr?
      erb :'questions/_errors', layout: false, locals: { errors: @ans_errors }
    else
      erb :"questions/show"
    end
  end
end

