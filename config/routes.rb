Rails.application.routes.draw do

  devise_for :users
  
  root 'home#index'
  
  #채팅
 get '/homes/index'
  resources :conversations, only: [:create] do
      member do
          post :close
      end
    resources :messages, only: [:create]
  end
  	
  mount ActionCable.server => '/cable'
  
  #전체 페이지
  get '/home/franchise'=>'home#franchise'
  get '/home/nonfranchise'=>'home#nonfranchise'
  get '/home/test'=>'home#test'
  
  #게시판
  get '/boards/list'=>'boards#list'
  get '/boards/create'=>'boards#create'
  post '/boards/create_at'=>'boards#create_at'
  get '/boards/show/:id'=>'boards#show'
  get '/boards/update/:id'=>'boards#update'
  post '/boards/update_at/:id'=>'boards#update_at'
  post '/boards/delete/:id'=>'boards#delete'
  
  ##comment
  
   get '/boards/show/:board_id/comments/create' => 'comments#create'

  get '' => 'comment#destroy'    # 어떻게 갈지는 아직 모르지만, 도착지는 알고있다.


  
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
