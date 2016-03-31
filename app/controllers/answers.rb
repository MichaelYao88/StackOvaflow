get '/questions/:question_id/answers/new' do
 @question = Question.find(params[:question_id])
 erb :"answers/_new"
end

post '/questions/:question_id/answers' do
  @question = Question.find(params[:question_id])
  @user = current_user
  @answer = Answer.create!(text: params[:text], question: @question, answerer: @user)
  redirect "/questions/#{params[:question_id]}"
end

put '/questions/:question_id/answers/:id' do
  @answer = Answer.find(params[:id])
  @answer.update!(text: params[:text])
  redirect "/questions/#{params[:question_id]}"
end

get '/questions/:question_id/answers/:id/edit' do
  @question = Question.find(params[:question_id])
  @answer = Answer.find(params[:id])
  erb :'answers/_edit'
end


get '/answers/:id' do
  @answer = Answer.find(params[:id])
  question= @answer.question
  question.answers.each do |answer|
    answer.update!(best_answer: false)
  end
  @answer.update!(best_answer: true)
  if request.xhr?
  end
end

delete '/questions/:question_id/answers/:id' do
  p "hahahahahahahahhahah"
  answer = Answer.find(params[:id])
  answer.destroy
  redirect "/questions/#{params[:question_id]}"
end

delete '/answers/:id' do
  answer = Answer.find_by(id: params[:id])
  question = answer.question
  answer.destroy
  if request.xhr?
  else
  redirect "/questions/#{question.id}"
  end
end
