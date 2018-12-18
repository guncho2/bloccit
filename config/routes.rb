Rails.application.routes.draw do

  #  resources :topics

  resources :question2s

  # get 'question2s/index'
  # get 'question2s/show'
  # get 'question2s/new'
  # get 'question2s/edit'

  resources :advertisements

  # get 'advertisements/index'
  # get 'advertisements/show'
  # get 'advertisements/new'
  # get 'advertisements/create'


  # #1
# resources :posts

resources :topics do
# #34
   resources :posts, except: [:index]





   resources :sponsored_posts, except: [:index]
 end


# #4
  resources :posts, only: [] do
# #5
    resources :comments, only: [:create, :destroy]
    post '/up-vote' => 'votes#up_vote', as: :up_vote
     post '/down-vote' => 'votes#down_vote', as: :down_vote
     resources :favorites, only: [:create, :destroy]


  end


# These new lines create POST routes at the URL posts/:id/up-vote and
# posts/:id/down-vote. The as key-value pairs at the end stipulate the method
# names which will be associated with these routes: up_vote_path and  down_vote_path.


 resources :users, only: [:new, :create, :show]
 post 'users/confirm' => 'users#confirm'

resources :sessions, only: [:new, :create, :destroy]

 #At #34 we pass resources :posts to the resources :topics block.
 #This nests the post routes under the topic routes.


  #get 'welcome/index'
  #get 'welcome/about'

  get 'about' => 'welcome#about'
# #2
  get 'welcome/contact'
  get 'welcome/faq'
  root 'welcome#index'


end
# For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

#At #1, we call the resources method and pass it a Symbol. This
#instructs Rails to create post routes for creating, updating,
#viewing, and deleting instances of Post. We'll review the precise
#URIs created in a moment.
#At #2, we remove get "welcome/index" because we've declared the
#index view as the root view. We also modify the about route to
#allow users to visit /about, rather than /welcome/about.

# At #7, we create routes for new and create actions. The only hash key will prevent Rails
# from creating unnecessary routes.


# At #4, we use only: [] because we don't want to create any /posts/:id routes, just posts/:post_id/comments routes.
#
# At #5, we only add create and destroy routes for comments. We'll display comments on the posts show view,
#  so we won't need index or new routes. We also won't give users the ability to view individual comments or
#  edit comments, removing the need for show, update, and edit routes.
