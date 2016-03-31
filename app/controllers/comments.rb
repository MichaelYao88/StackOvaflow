get '/questions/:question_id/comments/new' do
 @question = Question.find(params[:question_id])
 erb :"comments/_new"
end


post '/questions/:question_id/comments' do
  @question = Question.find(params[:question_id])
  @user = current_user
 	@new_comment = @question.comments.create(commenter: @user,text: params[:comment_text])


  redirect "/questions/#{params[:question_id]}"
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

