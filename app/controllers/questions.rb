get '/questions/new' do
  if current_user
  erb :'questions/new'
  else
    @message = "please log in"
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
