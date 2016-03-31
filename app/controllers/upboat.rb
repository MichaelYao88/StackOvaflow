post '/upboat/questions/:id' do
  question = Question.find(params[:id])
  vote = question.votes.find_or_create_by(voter: current_user)
  vote.value = 1
  vote.save
  if request.xhr?
    total = question.votes.reduce(0){ |sum, votes| sum + votes.value }
    (total).to_s
  else
  end
end

post '/downboat/questions/:id' do
  question = Question.find(params[:id])
  vote = question.votes.find_or_create_by(voter: current_user)
  vote.value = -1
  vote.save
  if request.xhr?
    total = question.votes.reduce(0){ |sum, votes| sum + votes.value }

    p (total).to_s
    # question.votes.count.to_s
  else
  end
end