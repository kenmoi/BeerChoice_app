Rails.application.routes.draw do
  devise_for :users, controllers: {
    registrations: 'users/registrations', sessions: 'users/sessions'
  }
  root to: 'homes#top'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get   'users/:id/mypage'  => 'users#mypage', as: 'mypage'
  get 'users/:id/delete_image'  => 'users#delete_image', as: 'delete_image'
  get   'users/:id/cancel'  => 'users#cancel', as: 'cancel'
  patch 'users/:id/quit'    => 'users#quit', as: 'quit'
  resources :users, only:[:index, :show, :edit, :update]
  resources :beers do
    resource :favorites, only: [:create, :destroy]
    resources :post_comments, only: [:create, :destroy]
  end
end