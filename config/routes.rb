Rails.application.routes.draw do
  get 'beers/new'
  get 'beers/index'
  get 'beers/show'
  get 'beers/edit'
  get 'users/:id/delete_image'  => 'users#delete_image', as: 'delete_image'
  devise_for :users, controllers: {
    registrations: 'users/registrations', sessions: 'users/sessions'
  }
  root to: 'homes#top'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get   'users/:id/mypage'  => 'users#mypage', as: 'mypage'
  get   'users/:id/cancel'  => 'users#cancel', as: 'cancel'
  patch 'users/:id/quit'     => 'users#quit', as: 'quit'
  resources :users, only:[:show, :edit, :update]
  get   'beers/score'  => 'users#score', as: 'score'
  resources :beers
end
