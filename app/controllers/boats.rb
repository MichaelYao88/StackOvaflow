post '/upboat/questions/:id' do
  question = Question.find(params[:id])
  if logged_in?
    vote = question.votes.find_or_create_by(voter: current_user)
    vote.value = 1
    vote.save
  end
  if request.xhr?
    total = question.votes.reduce(0){ |sum, votes| sum + votes.value }
    total.to_s
  else
    redirect '/'
  end
end

post '/upboat/comments/:id' do
  comment = Comment.find(params[:id])
  if logged_in?
    vote = comment.votes.find_or_create_by(voter: current_user)
    vote.value = 1
    vote.save
  end
  if request.xhr?
    total = comment.votes.reduce(0){ |sum, votes| sum + votes.value }
    total.to_s
  else
    question = comment.answer.question
    redirect "/questions/#{question.id}"
  end
end


post '/downboat/questions/:id' do
  question = Question.find(params[:id])
  if logged_in?
    vote = question.votes.find_or_create_by(voter: current_user)
    vote.value = -1
    vote.save
  end
  if request.xhr?
    total = question.votes.reduce(0){ |sum, votes| sum + votes.value }
    total.to_s
  else
    redirect '/'
  end
end

post '/downboat/comments/:id' do
  comment = Comment.find(params[:id])
  if logged_in?
    vote = comment.votes.find_or_create_by(voter: current_user)
    vote.value = -1
    vote.save
  end
 if request.xhr?
    total = comment.votes.reduce(0){ |sum, votes| sum + votes.value }
    total.to_s
  else
    question = comment.answer.question
    redirect "/questions/#{question.id}"
  end
end

post '/upboat/answers/:id' do
  answer = Answer.find(params[:id])
  if logged_in?
    vote = answer.votes.find_or_create_by(voter: current_user)
    vote.value = 1
    vote.save
  end
  if request.xhr?
    total = answer.votes.reduce(0){ |sum, votes | sum + votes.value }
    total.to_s
  else
    redirect '/'
  end
end

post '/downboat/answers/:id' do
  answer = Answer.find(params[:id])
  if logged_in?
    vote = answer.votes.find_or_create_by(voter: current_user)
    vote.value = -1
    vote.save
  end
  if request.xhr?
    total = answer.votes.reduce(0){ |sum, votes | sum + votes.value }
    total.to_s
  else
    redirect '/'
  end
end
