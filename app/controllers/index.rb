get '/' do
  @questions=Question.all
  @questions = @questions.sort{|a,b| vote_total(b)<=>vote_total(a)}
  erb :'questions/index'
end



