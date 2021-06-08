Rails.application.routes.draw do
  devise_for :users, controllers: {
    registrations: 'users/registrations',
    passwords: 'users/passwords'
  }
  devise_for :owners, controllers: {
    registrations: 'owners/registrations',
    passwords: 'owners/passwords'
  }
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root to: 'posts#main'
  resources :posts do
    resources :likes, only: [:create, :destroy]
    collection do
      get 'search'
    end
  end
  devise_scope :user do
    post 'users/guest_sign_in', to: 'users/sessions#guest_sign_in'
  end
  devise_scope :owner do
    post 'owners/guest_sign_in', to: 'owners/sessions#guest_sign_in'
  end
end
