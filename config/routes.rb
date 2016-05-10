Rails.application.routes.draw do
  resources :people do
    resources :phones, controller: 'people/phones'
      resources :friends, controller: 'people/friends' do
          resources :contacts, controller: 'people/friend/contacts'
      end
  end
end
