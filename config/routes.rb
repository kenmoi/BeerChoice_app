Rails.application.routes.draw do
  devise_for :users, controllers: {
    registrations: 'users/registrations'
  }
  root to: 'homes#top'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get   'users/:id/cancel'  => 'users#cancel'
  patch 'users/:id/quit'     => 'users#quit'
  resources :users, only:[:show, :edit, :update]
end
