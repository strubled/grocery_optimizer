Rails.application.routes.draw do

  get 'password_resets/new'
  get 'password_resets/edit'
  get 'weekslists/edit'
  get 'sessions/new'
  resources :weekslists do
    member do
        get :bought
    end
  end

  resources :weekslists do
    collection do
        get :bought
    end
  end
  resources :weekslists do
  collection do
    post 'destroy_all'
  end
end

  resources :weekslists do
  collection do
    post 'unbuy_all'
  end
end
  get 'users/new'
  root 'static_pages#home'
  get 'allitems'    => 'static_pages#allitems'
  get 'bulkadds'    => 'static_pages#bulkadds'
  get 'stores'    => 'static_pages#stores'
  get 'help'    => 'static_pages#help'
  get 'about'   => 'static_pages#about'
  get 'contact' => 'static_pages#contact'
  get 'signup'  => 'users#new'
  get    'login'   => 'sessions#new'
  post   'login'   => 'sessions#create'
  delete 'logout'  => 'sessions#destroy'
  resources :users
  resources :account_activations, only: [:edit]
  resources :password_resets,     only: [:new, :create, :edit, :update]
  resources :weekslists,   only: [:create, :bought, :edit, :bulkadd, :update, :destroy, :destroy_all, :unbuy_all]
  resources :bulkadd,   only: [:create, :bought, :edit, :bulkadd, :update, :destroy, :destroy_all, :unbuy_all]
  resources :allitems,   only: [:create, :edit, :search, :update, :destroy]
  resources :stores,   only: [:create, :edit, :update, :destroy]


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
