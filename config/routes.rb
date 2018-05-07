Rails.application.routes.draw do
 devise_for :users, :controllers => { omniauth_callbacks: 'user/omniauth_callbacks' }
  
  
  root 'home#index'
  get 'home/index'
  get 'home/show'
  get 'home/board2' => 'home#board2'
  get 'home/maketeam'

  
  get 'home/mainview'
 
  get '/users/sign_out' => 'home#index'
  #Read
  get 'home/index2' => 'home#index2'
  get 'home/main1' => 'home#main1'
  get 'home/method' => 'home#method'
  get 'home/function' => 'home#function'
  get 'home/board' => 'home#board'
  get 'home/quiz1' => 'home#quiz1'
  get 'home/quiz2' => 'home#quiz2'
  get 'home/quiz3' => 'home#quiz3'
  get 'home/quiz4' => 'home#quiz4'
  get 'home/ruby' => 'home#ruby'
  
  #  박결 연습용
  get 'home/method2' => 'home#method2'
  # 
  post 'home/value_save'
  # #로그인라우트
  #devise_for :users, :controllers => { omniauth_callbacks: 'user/omniauth_callbacks' }

  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  # root 'welcome#index'

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
