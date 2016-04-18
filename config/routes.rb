Rails.application.routes.draw do
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  root 'index#index'
  #account login
  get    'help'    => 'static_pages#help'
  get    'about'   => 'static_pages#about'
  get    'contact' => 'static_pages#contact'
  get    'signup'  => 'accounts#new'
  get    'login'   => 'sessions#new'
  post   'login'   => 'sessions#create'
  delete 'logout'  => 'sessions#destroy'

  get    'input_your_email' => 'accounts#input_your_email'
  post    'input_your_email' => 'accounts#input_your_email'

  get    'reset_your_password'  => 'accounts#reset_your_password'
  post    'reset_your_password'  => 'accounts#save_password_change'

  #forget password
  get    'check_your_email' => 'accounts#check_your_email'
  
  #resend email
  get   'resend_your_email' => 'accounts#resend_your_email'
  post  'resend_your_email' => 'accounts#resend_your_email'
  
  #Show user's workspace
  get 'profiles' => 'accounts#profiles'
  get 'profiles/:id' => 'accounts#profiles'
  
  get 'application' => 'accounts#application'

  #administrator login
  get 'managemore' => 'admins#moreshow'
  get 'manage' => 'admins#show'
  get 'adminsignup' => 'admins#new'
  post 'adminsignup' => 'admins#create'
  get 'adminlogin' => 'admin_sessions#new'
  post 'adminlogin' => 'admin_sessions#create'
  resources :admins
  
  #accounts has many applicaitons   
  get 'reject/:id' => 'admins#reject'
  get 'approve/:id' => 'admins#approve'
    resources :accounts do
      resources :applications
      resources :current_workers
      resources :accomodations
      resources :former_criminals
      resources :student_application
      resources :user_formerworkers
  end
  
  get '/save_change' => 'accounts#save_change'
  
  # Example of regular route:
  #   get 'products/:id' => 'catalog#view'

  # Example of named route that can be invoked with purchase_url(id: product.id)
  #   get 'products/:id/purchase' => 'catalog#purchase', as: :purchase

  # Example resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Example resource route with options:
  #   resources :products do
  #     member do
  #       get 'short'
  #       post 'toggle'
  #     end
  #
  #     collection do
  #       get 'sold'
  #     end
  #   end

  # Example resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Example resource route with more complex sub-resources:
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', on: :collection
  #     end
  #   end

  # Example resource route with concerns:
  #   concern :toggleable do
  #     post 'toggle'
  #   end
  #   resources :posts, concerns: :toggleable
  #   resources :photos, concerns: :toggleable

  # Example resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end
end
