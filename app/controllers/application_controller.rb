class ApplicationController < ActionController::Base

  include SessionsHelper


end


# SessionsController has no way of finding create_session - it won't recognize it as a valid method.
# We need to include SessionsHelper either directly in  SessionsController, or in ApplicationController
#  (which SessionsController inherits from). Let's add it to ApplicationController, since we'll need to
#   use it in other controllers later
