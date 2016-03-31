post '/upboat/questions/:id' do
  question = Question.find(params[:id])
  vote = question.votes.find_or_create_by(voter: current_user, value: 1)
  if request.xhr?
    question.votes.count.to_s
  else
  end
end