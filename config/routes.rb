Rails.application.routes.draw do
  resources :people do
      resources :phones, controller: 'people/phones'
      resources :friends, controller: 'people/friends'
    end
  # namespace :people do
  # get 'phones/index'
  # end
  #
  # namespace :people do
  # get 'phones/show'
  # end
  #
  # namespace :people do
  # get 'phones/new'
  # end
  #
  # namespace :people do
  # get 'phones/create'
  # end
  #
  # namespace :people do
  # get 'phones/edit'
  # end
  #
  # namespace :people do
  # get 'phones/update'
  # end
  #
  # namespace :people do
  # get 'phones/destroy'
  # end
  #
  # namespace :people do
  # get 'friends/index'
  # end
  #
  # namespace :people do
  # get 'friends/show'
  # end
  #
  # namespace :people do
  # get 'friends/new'
  # end
  #
  # namespace :people do
  # get 'friends/create'
  # end
  #
  # namespace :people do
  # get 'friends/edit'
  # end
  #
  # namespace :people do
  # get 'friends/update'
  # end
  #
  # namespace :people do
  # get 'friends/destroy'
  # end
  # resources :people
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
