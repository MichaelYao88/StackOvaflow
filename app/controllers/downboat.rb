post '/downboat/questions/:id' do
  question = Question.find(params[:id])
  vote = question.votes.find_or_create_by(voter: current_user, value: 1)
  if request.xhr?
    #value of votes total iteration to calculate sum and ajax to implement
    question.votes.count.to_s
  else
  end
end