class VotesController < ApplicationController

  #24
   before_action :require_sign_in

 #   def up_vote
 #     @post = Post.find(params[:post_id])
 #     @vote = @post.votes.where(user_id: current_user.id).first
 #
 #     if @vote
 #       @vote.update_attribute(:value, 1)
 #     else
 #       @vote = current_user.votes.create(value: 1, post: @post)
 #     end
 #
 # # #25
 #     redirect_back(fallback_location: :root)
 #   end

 def up_vote
      update_vote(1)
      redirect_back(fallback_location: :root)
    end



      # def down_vote
      #   @post = Post.find(params[:post_id])
      #   @vote = @post.votes.where(user_id: current_user.id).first
      #
      #   if @vote
      #     @vote.update_attribute(:value, -1)
      #   else
      #     @vote = current_user.votes.create(value: -1, post: @post)
      #   end
      #
      #   redirect_back(fallback_location: :root)
      # end


      def down_vote
     update_vote(-1)
     redirect_back(fallback_location: :root)
   end

   private
   def update_vote(new_value)
     @post = Post.find(params[:post_id])
     @vote = @post.votes.where(user_id: current_user.id).first

     if @vote
       @vote.update_attribute(:value, new_value)
     else
       @vote = current_user.votes.create(value: new_value, post: @post)
     end
   end




end


# At #24, we require user to be signed-in before they're allowed to vote on a post.
#
# At #25, we redirect the user back to the view that issued the request.
