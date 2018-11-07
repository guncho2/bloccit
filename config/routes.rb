Rails.application.routes.draw do

  # get 'question2s/index'
  # get 'question2s/show'
  # get 'question2s/new'
  # get 'question2s/edit'

  resources :question2s


  resources :advertisements

  get 'advertisements/index'
  get 'advertisements/show'
  get 'advertisements/new'
  get 'advertisements/create'


  # #1
resources :posts

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
