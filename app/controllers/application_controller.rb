class ApplicationController < ActionController::Base

  include SessionsHelper

  private
   # #10
     def require_sign_in
       unless current_user
         flash[:alert] = "You must be logged in to do that"
   # #11
         redirect_to new_session_path
       end
     end

end


# SessionsController has no way of finding create_session - it won't recognize it as a valid method.
# We need to include SessionsHelper either directly in  SessionsController, or in ApplicationController
#  (which SessionsController inherits from). Let's add it to ApplicationController, since we'll need to
#   use it in other controllers later


# At #10, we define require_sign_in to redirect un-signed-in users. We define this method in ApplicationController because we'll eventually want to call it from other controllers.
#
# Remember that controllers are classes, and all controllers inherit from the  ApplicationController class.
#
# At #11, we redirect un-signed-in users to the sign-in page.
