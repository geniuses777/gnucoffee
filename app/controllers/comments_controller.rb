class CommentsController < ApplicationController
 def create
    @comment = Comment.new
    @comment.content = params[:input_comment]
    @comment.board_id = params[:board_id]
    @comment.user = current_user.name
    @comment.save
    
    redirect_to "/boards/show/#{params[:board_id]}"
  end
  
  def destroy
    @comment = Comment.find(params[])         #삭제할 코멘트 찾기
    @comment.destroy
    
    redirect_to "/boards/show/#{params[:board_id]}"
  end
end
