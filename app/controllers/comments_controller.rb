class CommentsController < ApplicationController

  def create
    name = comment_params['user_attributes']['username']
    comment = Comment.create
    comment.post_id = comment_params['post_id']
    comment.content = comment_params['content']
    id =(name.empty? ? comment_params['user_id'] : User.create(username: name).id)
    comment.user_id = id
    redirect_to comment.post
  end

  private

  def comment_params
    params.require(:comment).permit(:content, :post_id, :user_id, user_attributes:[:username])
  end
end
