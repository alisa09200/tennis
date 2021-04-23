class CommentsController < ApplicationController
  def create
    Comment.create(comment_params)
    redirect_to reservation_path(params[:reservation_id])
  end

  private
  def comment_params
    params.require(:comment).permit(:text).merge(user_id: current_user.id, reservation_id: params[:reservation_id])
  end
end
