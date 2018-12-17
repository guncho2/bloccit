module PostsHelper

  # def user_is_authorized_for_post?(post)
  #       current_user && (current_user == post.user || current_user.admin?)
  #  end
  #
  #  def  can_delete(post)
  #    current_user && (current_user == post.user || current_user.admin?)
  #  end
  #
  #  def user_is_moderator?(post)
  #     current_user.moderator?
  #   end

  def user_can_edit?(post)
          current_user && (current_user == post.user || current_user.admin? || current_user.moderator?)
      end

      def user_can_delete?(post)
          current_user && (current_user == post.user || current_user.admin?)
      end


end
