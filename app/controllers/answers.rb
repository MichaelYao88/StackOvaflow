get '/questions/:question_id/answers/new' do
 @question = Question.find(params[:question_id])
 erb :"partials/_answers"
end

post '/questions/:question_id/answers' do
  @question = Question.find(params[:question_id])
  @user = current_user
  @answer = Answer.create!(text: params[:text], question: @question, answerer: @user)
  p @answer
  p @question
  p @user
  redirect "/questions/#{params[:question_id]}"
end

