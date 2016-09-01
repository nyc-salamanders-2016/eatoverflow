post '/questions/:id/vote' do
  @question = Question.find(params[:id])
  @answers = @question.answers
  @score = get_score(@question)

  if params[:vote] == "upvote" 
   upvote = @question.votes.new(value: 1, user_id: current_user.id )
    if upvote.authenticate_vote(current_user.id, @question.id) == false
      upvote.save
      redirect "/questions/#{@question.id}"
    else
      @error = "You can only vote once"
      erb :"questions/show"
    end
  else
    downvote = @question.votes.new(value: -1, user_id: current_user.id )
    if downvote.authenticate_vote(current_user.id, @question.id) == false
      downvote.save
      redirect "/questions/#{@question.id}"
    else
      @error = "You can only vote once"
      erb :"questions/show"
    end
  end
  # redirect "/questions/#{@question.id}"
end

post '/answers/:id/vote' do
  answer = Answer.find(params[:id])
  question = answer.question
  if params[:vote] == "upvote"
    answer.votes.create(value: 1, user_id: current_user.id )
  else
    answer.votes.create(value: -1, user_id: current_user.id )
  end
  redirect "/questions/#{question.id}"
end