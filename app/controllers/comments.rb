get '/questions/:question_id/comments/new' do
 @question = Question.find(params[:question_id])
 erb :"comments/_new"
end

get '/answers/:answer_id/comments/new' do
 @answer = Answer.find(params[:answer_id])
 erb :"comments/_new_answer"
end



post '/questions/:question_id/comments' do
  @question = Question.find(params[:question_id])
  @user = current_user
 	@new_comment = @question.comments.create(commenter: @user, text: params[:comment_text])


  redirect "/questions/#{params[:question_id]}"
end

post '/answers/:answer_id/comments' do
  @answer = Answer.find(params[:answer_id])
  @question= @answer.question
  @user = current_user
 	@new_comment = @answer.comments.create(commenter: @user,text: params[:comment_text])


  redirect "/questions/#{@question.id}"
end

get '/comments/:id/edit' do
	@comment = Comment.find(params[:id])

	erb :"/comments/_edit"
end

put '/comments/:id' do
	@comment=Comment.find(params[:id])
	@question=@comment.commentable.id
	@comment.update(text: params[:comment_text])

	redirect "/questions/#{@question}"
end

delete '/comments/:id' do
  p comment = Comment.find_by(id: params[:id])
  # question = comment.question
  comment.destroy
  if request.xhr?
  else
  redirect "/questions/#{question.id}"
  end
end
