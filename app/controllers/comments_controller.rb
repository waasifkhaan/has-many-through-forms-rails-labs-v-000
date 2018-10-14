class CommentsController < ApplicationController

  def create
    comment = Comment.create(post_id: comment_params['post_id'], content: comment_params['content'] )
    name = comment_params['user_attributes']['username']
    id = ( name.empty? ? comment_params['user_id'] : User.create(username: name).id )
    comment.update(user_id: id)
    redirect_to comment.post
  end

  private
  def comment_params
    params.require(:comment).permit(:content, :post_id, :user_id, user_attributes: [:username])
  end
end
