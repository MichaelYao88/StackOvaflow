post '/upboat/questions/:id' do
  question = Question.find(params[:id])
  vote = question.votes.find_or_create_by(voter: current_user)
  vote.value = 1
  vote.save
  if request.xhr?
    total = question.votes.reduce(0){ |sum, votes| sum + votes.value }
    total.to_s
  else
    redirect '/'
  end
end

post '/downboat/questions/:id' do
  question = Question.find(params[:id])
  vote = question.votes.find_or_create_by(voter: current_user)
  vote.value = -1
  vote.save
  if request.xhr?
    total = question.votes.reduce(0){ |sum, votes| sum + votes.value }
    total.to_s
  else
    redirect '/'
  end
end

post '/upboat/answers/:id' do
  answer = Answers.find(params[:id])
  vote = answer.votes.find_or_create_by(voter: current_user)
  vote.value = 1
  vote.save
  if request.xhr?
    total = answer.votes.reduce(0){ |sum, votes | sum + votes.value }
    total.to_s
  else
    redirect '/'
  end
end

post '/downboat/answers/:id' do

end
