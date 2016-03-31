post '/downboat/questions/:id' do
  question = Question.find(params[:id])
  vote = question.votes.find_or_create_by(voter: current_user, value: 1)
  if request.xhr?
    total = question.votes.reduce(0){ |sum, votes| sum + votes.value }
    (total + 1).to_s
    # question.votes.count.to_s
  else
  end
end