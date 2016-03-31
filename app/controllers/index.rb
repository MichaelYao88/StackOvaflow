get '/' do
  @questions=Question.all
  erb :'questions/index'
end



