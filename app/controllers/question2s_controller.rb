class Question2sController < ApplicationController
  def index
    @question2s = Question2.all

  end

  def show
    @question2 = Question2.find(params[:id])

  end

  def new
    @question2 = Question2.new

  end
def create
  @question2 = Question2.new(params.require(:question2).permit(:title, :body, :resolved))
  if @question2.save
    flash[:notice] = "Question was saved"
    redirect_to @question2
  else
    flash[:error] = "There was an error saving the question. Please try again"
    render :new
  end
end
def update
     @question2 = Question2.find(params[:id])
     if @question2.update_attributes(params.require(:question2).permit(:title, :body, :resolved))
       flash[:notice] = "Question2 was updated"

    #  @question2.title = params[:question2][:title]
    #  @question2.body = params[:question2][:body]

    #  if @question2.save
    #    flash[:notice] = "Question2 was updated."
       redirect_to @question2


     else
flash[:error] = "There was an error saving the post. Please try again."

      #  flash.now[:alert] = "There was an error saving the post. Please try again."
       render :edit
     end
   end

   def destroy
@question2 = Question2.find(params[:id])

# #8
if @question2.destroy
  flash[:notice] = "\"#{@question2.title}\" was deleted successfully."
  redirect_to question2_path
else
  flash.now[:alert] = "There was an error deleting the post."
  render :show
end
end


  def edit
       @question2 = Question2.find(params[:id])

  end
end
