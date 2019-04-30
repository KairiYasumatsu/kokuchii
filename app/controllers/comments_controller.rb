class CommentsController < ApplicationController


 def create
   @comment = Comment.new(comment_params)
   @comment.post_id = params[:post_id]
   @comment.user_id = current_user.id
   if @comment.save!
     redirect_back(fallback_location: posts_path)
   else
     redirect_back(fallback_location: posts_path)
   end

 end

 private
 def comment_params
   params.require(:comment).permit(:content, :user_id, :post_id)
 end
end
