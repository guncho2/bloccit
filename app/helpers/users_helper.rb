module UsersHelper

  def posts_or_comments_for_user?(user)
	        user.posts.any? || user.comments.any?
	    end

      # Create a helper method that detects if there are posts or comments for a given user
      # Use the helper method to display a message instead of the <h2> if no posts or comments exist.

      
end
