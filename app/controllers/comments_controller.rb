class CommentsController < ApplicationController

  def create
    if comment_params['user_attributes']['username'] != ""
      user = User.create(username: comment_params['user_attributes']['username'])
      comment = Comment.create(
        post_id: comment_params['post_id'],
        user_id: user.id,
        content: comment_params['content'],
      )
    else
      comment = Comment.create(
      post_id: comment_params['post_id'],
      user_id: comment_params['user_id'],
      content: comment_params['content']
      )
    end
    
    redirect_to comment.post
  end

  private

  def comment_params
    params.require(:comment).permit(:content, :post_id, :user_id, user_attributes:[:username])
  end
end
