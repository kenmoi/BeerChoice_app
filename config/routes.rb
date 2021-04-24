Rails.application.routes.draw do
  devise_for :users, controllers: {
    registrations: 'users/registrations', sessions: 'users/sessions'
  }
  root to: 'homes#top'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get '/post' => 'searchs#search'
  get   'users/:id/mypage'  => 'users#mypage', as: 'mypage'
  get 'users/:id/delete_image'  => 'users#delete_image', as: 'delete_image'
  get   'users/:id/cancel'  => 'users#cancel', as: 'cancel'
  get   'users/:id/post_index'  => 'users#post_index', as: 'post_index'
  get   'users/:id/favorite'  => 'favorites#index', as: 'favorite'
  get   'homes/score'  => 'homes#score', as: 'score'
  patch 'users/:id/quit'    => 'users#quit', as: 'quit'
  resources :users, only:[:index, :show, :edit, :update]
  resources :beers do
    resource :favorites, only: [:create, :destroy]
    resources :post_comments, only: [:create, :destroy]
  end
end