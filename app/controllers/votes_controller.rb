post '/questions/:id/vote' do
  question = Question.find(params[:id])
  if params[:vote] == "upvote"
    question.votes.create(value: 1, user_id: current_user.id )
  else
    question.votes.create(value: -1, user_id: current_user.id )
  end
  redirect "/questions/#{question.id}"
end