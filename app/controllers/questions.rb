get '/questions/new' do
  erb :'questions/index'
end

get '/questions/:id' do
  @question = Question.find_by(id: params[:id])
  if @question
    erb :'questions/article'
  else
    redirect '/'
  end

end
