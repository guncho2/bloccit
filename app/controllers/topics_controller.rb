class TopicsController < ApplicationController

  # #7
  before_action :require_sign_in, except: [:index, :show]
# #8
 #  before_action :authorize_user, except: [:index, :show]
 #
 # before_action :is_moderator?, only: [:new, :index, :show, :update, :edit]

 before_action :authorize_user_to_edit, except: [:index, :show, :new, :create, :destroy]
    before_action :authorize_user_to_create_or_delete, except: [:index, :show, :edit, :update]








  def index
  @topics = Topic.all
end


  def show
    @topic = Topic.find(params[:id])
  end


    def new
      @topic = Topic.new
    end


       def create
        #  @topic = Topic.new
        #  @topic.name = params[:topic][:name]
        #  @topic.description = params[:topic][:description]
        #  @topic.public = params[:topic][:public]
        @topic = Topic.new(topic_params)

         if @topic.save
           redirect_to @topic, notice: "Topic was saved successfully."
         else
           flash.now[:alert] = "Error creating topic. Please try again."
           render :new
         end
       end


  def edit
    @topic = Topic.find(params[:id])
  end


    def update
      @topic = Topic.find(params[:id])

      # @topic.name = params[:topic][:name]
      # @topic.description = params[:topic][:description]
      # @topic.public = params[:topic][:public]
      @topic.assign_attributes(topic_params)

      if @topic.save
         flash[:notice] = "Topic was updated."
        redirect_to @topic
      else
        flash.now[:alert] = "Error saving topic. Please try again."
        render :edit
      end
    end

    def destroy
       @topic = Topic.find(params[:id])

       if @topic.destroy
         flash[:notice] = "\"#{@topic.name}\" was deleted successfully."
         redirect_to action: :index
       else
         flash.now[:alert] = "There was an error deleting the topic."
         render :show
       end
     end

     private
   def topic_params
     params.require(:topic).permit(:name, :description, :public)
   end


   # #9
    #  def authorize_user
    #    unless current_user.admin?
    #      flash[:alert] = "You must be an admin to do that."
    #      redirect_to topics_path
    #    end
    #  end
     #
    #  def is_moderator?
    #      unless current_user.moderator?
    #        flash[:alert] = "You must be an admin to do that."
    #        redirect_to topics_path
    #      end
    #    end

    def authorize_user_to_edit
        unless current_user.admin? || current_user.moderator?
            flash[:alert] = "You must be an admin or moderator to do that."
            redirect_to topics_path
        end
    end

    def authorize_user_to_create_or_delete
        unless current_user.admin?
            flash[:alert] = "You must be an admin to do that."
            redirect_to topics_path
        end
    end

    




end



# redirect_to action: :index is the same as redirect_to topics_path because
# topics_path routes to the index action per Rails' resourceful routing.

# At #7, we use the before_action filter and the require_sign_in method from  ApplicationController to redirect guest users who attempt to access controller actions other than index or show.
#
# At #8, we use another before_action filter to check the role of signed-in users. If the  current_user isn't an admin, we'll redirect them to the topics index view.
#
# At #9, we define authorize_user, which is used in #8 to redirect non-admin users to  topics_path (the topics index view).
