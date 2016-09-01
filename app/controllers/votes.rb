post '/questions/:id/vote' do
  @question = Question.find(params[:id])
  @answers = @question.answers
  @score = get_score(@question)

  if params[:vote] == "upvote" 
    vote = @question.votes.new(value: 1, user_id: current_user.id )
    if vote.save
      redirect "/questions/#{@question.id}"
    else
      @errors = vote.errors.full_messages
      erb :"questions/show"
    end
  else params[:vote] == "downvote"
    vote = @question.votes.new(value: -1, user_id: current_user.id )
    if vote.save
      redirect "/questions/#{@question.id}"
    else
      @errors = vote.errors.full_messages
      erb :"questions/show"
    end
  end
end

post '/answers/:id/vote' do
  answer = Answer.find(params[:id])
  @question = answer.question
  @answers = @question.answers
  @score = get_score(@question)

   if params[:vote] == "upvote" 
    vote = answer.votes.new(value: 1, user_id: current_user.id )
    if vote.save
      redirect "/questions/#{@question.id}"
    else
      @ans_errors = vote.errors.full_messages
      erb :"questions/show"
    end
  else params[:vote] == "downvote"
    vote = answer.votes.new(value: -1, user_id: current_user.id )
    if vote.save
      redirect "/questions/#{@question.id}"
    else
      @ans_errors = vote.errors.full_messages
      erb :"questions/show"
    end
  end
end
