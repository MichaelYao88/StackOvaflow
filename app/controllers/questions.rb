get '/questions/new' do
  if current_user
  erb :'questions/new'
  else
    @errors = ["please log in"]
  erb :'questions/index'
  end
end


get '/questions/:id' do
  @question = Question.find_by(id: params[:id])
  if @question
    erb :'questions/article'
  else
    erb :'questions/index'
  end
end

post '/questions' do
  p current_user
  question = Question.new(question_title: params[:question_title],question_body: params[:question_body], questioner: current_user)
  p question.questioner
  p question.questioner == current_user
  if question.save
    p "yoooooooooooooo"
    redirect '/'
  else
    @errors =["yo you gotta add a title or body to this"]
    erb :'questions/new'
  end
end
